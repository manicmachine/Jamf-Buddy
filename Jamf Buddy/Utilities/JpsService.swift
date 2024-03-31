//
//  JPSNetworkManager.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 11/10/23.
//

import Foundation
import OSLog
import Observation

@Observable class JpsService {
    let logger = Logger()

    var dashboard: Dashboard?
    
    var computerCount: Int = 0
    var computers: [Computer] = []

    var isAuthenticated: Bool = false
    var isFetching: Bool = false
    var hasError: Bool = false
    var error: Error? {
        didSet {
            self.hasError = (self.error == nil) ? false : true
        }
    }

    let renewalCushion: Double = 2 * 60 // 2 minutes

    private var jpsUrl: String = ""
    private var username: String = ""
    private var password: String = ""
    private var renewalTimerSet: Bool = false
    private var jpsToken: AuthToken? = nil {
        didSet {
            self.isAuthenticated = true
            
            if !self.renewalTimerSet {
                setupTokenRenewalTimer()
            }
        }
    }
    
    @MainActor
    func authenticate(url: String, username: String, password: String, isApiClient: Bool = false) async {
        // TODO: Implement Api Client behavior
        logger.info("Attempting to authenticate with the JPS")
//        self.isFetching = true

        let schemePattern = try! Regex(#"^.*://"#)
        var mutableUrl = url

        // Make sure we're only sending secure communications
        if let match = try! schemePattern.firstMatch(in: mutableUrl) {
            logger.debug("Scheme detected in provided URL, verifying HTTPS is being used")
            if match.0 != "https://" {
                logger.debug("Insecure scheme provided, converting scheme to HTTPS")
                mutableUrl = mutableUrl.replacingOccurrences(of: match.0, with: "https://")
            }
        } else {
            logger.debug("No scheme detected in provided URL, prepending HTTPS scheme")
            mutableUrl = "https://\(mutableUrl)"
        }
        
        guard let url = URL(string: mutableUrl + JpsEndpoint.authenticate.rawValue) else {
            logger.error("Invalid JPS URL provided, unable to create URL object")
            self.error = JpsError.InvalidURL
            return
        }

        guard let authString = getBasicAuthString(username: username, password: password) else {
            logger.error("Invalid JPS credentials provided, unable to produce base64 encoded auth string")
            self.error = JpsError.InvalidCredentials
            return
        }

        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "accept")
        req.addValue("Basic \(authString)", forHTTPHeaderField: "authorization")
        
        do {
            logger.debug("Sending authentication request")
            let (data, res) = try await URLSession.shared.data(for: req)
            if let response = res as? HTTPURLResponse {
                logger.debug("Authentication request: \(response.statusCode) response code received")
                if response.statusCode == 200 {
                    logger.info("Authentication successful")
                    
                    self.jpsToken = try? JSONDecoder().decode(AuthToken.self, from: data)
                    self.jpsUrl = mutableUrl
                    self.username = username
                    self.password = password
                } else {
                    throw mapResponseCodeToError(for: response.statusCode)
                }
            }
        } catch {
            logger.error("Unable to authenticate to the JPS: \(error)")
            self.error = error
        }
    }
    
    @MainActor
    func renewToken() async {
        logger.info("Attempting to renew JPS token")
        guard let url = URL(string: jpsUrl + JpsEndpoint.keepAlive.rawValue), let token = jpsToken?.token else {
            logger.error("Error renewing JPS token, URL or token is missing")
            return
        }

        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "accept")
        req.addValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        
        do {
            let (data, res) = try await URLSession.shared.data(for: req)
            if let response = res as? HTTPURLResponse {
                if response.statusCode == 200 {
                    logger.info("JPS token renewal successful")
                    
                    self.jpsToken = try? JSONDecoder().decode(AuthToken.self, from: data)
                } else {
                    throw mapResponseCodeToError(for: response.statusCode)
                }
            }
        } catch {
            logger.error("Unable to renew JPS token: \(error)")
            self.error = error
        }
    }
    
    func setupTokenRenewalTimer() {
        if let token = self.jpsToken {
            DispatchQueue.main.async {
                Timer.scheduledTimer(withTimeInterval: token.renewalInterval - self.renewalCushion, repeats: true) { _ in
                    Task {
                        await self.renewToken()
                    }
                }
            }
            
            self.renewalTimerSet = true
        }
    }
    
    func getBasicAuthString(username: String, password: String) -> String? {
        return "\(username):\(password)".data(using: .utf8)?.base64EncodedString()
    }
    
    @MainActor
    func retrieveAll() async throws {
        do {
            await withThrowingTaskGroup(of: Any.self) { group in
                group.addTask { try await self.getDashboard() }
                group.addTask { try await self.getAllComputers() }
//                group.addTask { try await self.getAllMobileDevices() }
//                group.addTask { try await self.getAllUsers() }
            }
        }
    }
    
    @MainActor
    func getDashboard() async throws {
        logger.info("Attempting to retrieve dashboard")

        guard let url = URL(string: jpsUrl + JpsEndpoint.dashboard.rawValue), let token = jpsToken?.token else {
            logger.error("Error requesting dashboard, URL or token is missing")
            return
        }
        
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        req.addValue("application/json", forHTTPHeaderField: "accept")
        req.addValue("Bearer \(token)", forHTTPHeaderField: "authorization")

        do {
            logger.debug("Sending dashboard request")
            let (data, res) = try await URLSession.shared.data(for: req)
            if let response = res as? HTTPURLResponse {
                logger.debug("Dashboard request: \(response.statusCode) response code received")
                if response.statusCode == 200 {
                    self.dashboard = try JSONDecoder().decode(Dashboard.self, from: data)
                } else {
                    throw mapResponseCodeToError(for: response.statusCode)
                }
            }
        } catch {
            logger.error("Unable to retrieve dashboard from the JPS: \(error)")
            self.error = error
        }
    }
    
    @MainActor
    func getAllComputers() async throws {
        logger.info("Attempting to retrieve list of computers")
        computers.removeAll()
        var page: Int = 0
        repeat {
            guard let url = URL(string: jpsUrl + JpsEndpoint.computerList.with(sections: [.general, .hardware], page: page)), let token = jpsToken?.token else {
                logger.error("Error requesting computers, URL or token is missing")
                return
            }
            
            page += 1

            var req = URLRequest(url: url)
            req.httpMethod = "GET"
            req.addValue("application/json", forHTTPHeaderField: "accept")
            req.addValue("Bearer \(token)", forHTTPHeaderField: "authorization")

            do {
                logger.debug("Sending computer list request")
                let (data, res) = try await URLSession.shared.data(for: req)
                if let response = res as? HTTPURLResponse {
                    logger.debug("Computer list request: \(response.statusCode) response code received")
                    if response.statusCode == 200 {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .formatted(.iso8601)
                        
                        let results = try decoder.decode(ComputersListResults.self, from: data)
                        self.computerCount = results.totalCount
                        self.computers.append(contentsOf: results.computers)
                        
                        logger.debug("\(results.computers.count) received, \(results.totalCount) total computers reported by JPS")
                        logger.debug("Processed \(self.computers.count) thus far")
                    } else {
                        throw mapResponseCodeToError(for: response.statusCode)
                    }
                }
            } catch {
                logger.error("Unable retrieve computers from the JPS: \(error)")
                self.error = error
            }
        } while computers.count < computerCount
    }
    
    func getAllMobileDevices() async throws {
        
    }
    
    func getAllUsers() async throws {
        
    }
    
    @MainActor
    func getComputerDetails(for computer: Computer) async throws -> Computer {
        guard let url = URL(string: jpsUrl + JpsEndpoint.computerDetails.with(values: ["id": computer.id])), let token = jpsToken?.token else {
            logger.error("Error requesting computer \(computer.id), URL or token is missing")
            throw JpsError.UnknownError
        }

        async let computerDetails = {
            self.logger.info("Attempting to retrieve details for computer \(computer.id)")

            var resComputer: Computer?
            var req = URLRequest(url: url)
            req.httpMethod = "GET"
            req.addValue("application/json", forHTTPHeaderField: "accept")
            req.addValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            do {
                self.logger.debug("Sending computer details request")
                let (data, res) = try await URLSession.shared.data(for: req)
                if let response = res as? HTTPURLResponse {
                    self.logger.debug("Computer details request: \(response.statusCode) response code received")
                    if response.statusCode == 200 {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .formatted(.iso8601)
                        
                        resComputer = try! decoder.decode(Computer.self, from: data)
                    } else {
                        throw self.mapResponseCodeToError(for: response.statusCode)
                    }
                    
                    resComputer  = resComputer ?? computer
                }
            } catch {
                self.logger.error("Unable retrieve computer \(computer.id) from the JPS: \(error)")
                self.error = error
                
                return computer
            }
            
            return resComputer!
        }
        
        return await computerDetails()
    }
    
    func mapResponseCodeToError(for code: Int) -> JpsError {
        logger.debug("Mapping error for code \(code)")

        switch code {
        case 400: return JpsError.BadRequest
        case 401: return JpsError.Unauthorized
        case 403: return JpsError.Forbidden
        case 404: return JpsError.NotFound
        case 405: return JpsError.MethodNotAllowed
        case 500: return JpsError.InternalError
        case 502: return JpsError.BadGateway
        case 503: return JpsError.ServiceUnavailable
        case 504: return JpsError.GatewayTimeout
        default: return JpsError.UnknownError
        }
    }
}

enum JpsError: String, Error {
    // General errors
    case InvalidURL = "Invalid URL provided"
    case InvalidCredentials = "Invalid credentials provided"
    case UnknownError = "An unknown error has occurred"
    
    // Http client errors
    case BadRequest = "Error 400"
    case Unauthorized = "Error 401, unauthorized access"
    case Forbidden = "Error 403, forbidden access"
    case NotFound = "Error 404, requested resource not found"
    case MethodNotAllowed = "Error 405, method not allowed for given resource"
    
    // Http server errors
    case InternalError = "Error 500, internal server error encountered"
    case BadGateway = "Error 502, bad gateway"
    case ServiceUnavailable = "Error 503, service unavailable"
    case GatewayTimeout = "Error 504, gateway timeout"
}
