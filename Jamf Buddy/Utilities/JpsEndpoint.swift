//
//  JpsEndpoints.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 11/10/23.
//

import Foundation

enum JpsEndpoint: String {
    // authentication/authorization
    case authenticate = "/api/auth/tokens"
    case keepAlive = "/api/v1/auth/keep-alive"
    case authorizationDetails = "/api/v1/auth"

    // computers
    case computerList = "/api/v1/computers-inventory"
    case computerDetails = "/api/v1/computers-inventory-detail/{id}"
    case advComputerSearchList = "/JSSResource/advancedcomputersearches"
    case advComputerSearchDetails = "/JSSResource/advancedcomputersearches/{id}"
    case computerGroupList = "/JSSResource/computergroups"
    case computerGroupDetails = "/JSSResource/computergroups/id/{id}"
    case computerConfigurationProfileList = "/JSSResource/osxconfigurationprofiles"
    case computerConfigurationProfileDetails = "/JSSResource/osxconfigurationprofiles/id/{id}"
    case computerPolicyList = "/JSSResource/policies"
    case computerPolicyDetails = "/JSSResource/policies/id/{id}"
    case computerAppList = "/JSSResource/macapplications"
    case computerAppDetails = "/JSSResource/macapplications/id/{id}"
    case computerAppInstallerList = "/api/v1/app-installers/deployments"
    case computerAppInstallerDetails = "/api/v1/app-installers/deployments/{id}"
    
    // mobile devices
    case mobileDeviceList = "/api/v2/mobile-devices/detail"
    case mobileDeviceDetails = "/api/v2/mobile-devices/{id}"
    case advMobileDeviceSearchList = "/JSSResource/advancedmobiledevicesearches"
    case advMobileDeviceSearchDetails = "/JSSResource/advancedmobiledevicesearches/{id}"
    case mobileDeviceGroupList = "/JSSResource/mobiledevicegroups"
    case mobileDeviceGroupDetails = "/JSSResource/mobiledevicegroups/id/{id}"
    case mobileDeviceConfigurationProfileList = "/JSSResource/mobiledeviceconfigurationprofiles"
    case mobileDeviceConfigurationProfileDetails = "/JSSResource/mobiledeviceconfigurationprofiles/id/{id}"
    case mobileDeviceAppList = "/JSSResource/mobiledeviceapplications"
    case mobileDeviceAppDetails = "/JSSResource/mobiledeviceapplications/id/{id}"

    // users
    case userList = "/JSSResource/users"
    case userDetails = "/JSSResource/users/id/{id}"
    case advUserSearches = "/JSSResource/advancedusersearches"
    case advUserSearchDetails = "/JSSResource/advancedusersearches/{id}"
    case userGroupList = "/JSSResource/usergroups"
    case userGroupDetails = "/JSSResource/usergroups/id/{id}"
    
    // ebooks
    case ebookList = "/api/v1/ebooks"

    // departments
    case departmentsList = "/api/v1/departments"

    // buildsings
    case buildingsList = "/api/v1/buildings"

    // categories
    case categoriesList = "/api/v1/categories"
    
    // scripts
    case scriptsList = "/api/v1/scripts"
    case getScript = "/api/v1/script/{id}"
    
    // laps
    case lapsPendingRotations = "/api/v2/local-admin-password/pending-rotations"
    case lapsAudit = "/api/v2/local-admin-password/{clientManagementId}/account/{username}/audit"
    case lapsHistory = "/api/v2/local-admin-password/{clientManagementId}/account/{username}/history"
    case lapsPassword = "/api/v2/local-admin-password/{clientManagementId}/account/{username}/password"
    case lapsAccounts = "/api/v2/local-admin-password/{clientManagementId}/accounts"
    case lapsSetPassword = "/api/v2/local-admin-password/{clientManagementId}/set-password"
    
    // sites
    case sitesList = "/api/v1/sites"
    
    // server & utilities
    case dashboard = "/api/v1/dashboard"
    case jpsVersion = "/api/v1/jamf-pro-version"
    case notifications = "/api/v1/notifications"
    case deleteNotification = "/api/v1/notifications/{type}/{id}"
    
//    func withValues(_ values: [String: String]) -> String {
//        var url: String = self.rawValue
//        for element in values {
//            url = url.replacingOccurrences(of: element.key, with: element.value)
//        }
//        
//        return url
//    }
//    
//    func withSections(_ values: [JpsApiSection]) -> String {
//        var url: String = self.rawValue
//        let queryPattern = try! Regex(#".*\?.*"#)
//        var isFirstElement: Bool = (try? queryPattern.firstMatch(in: url)) != nil ? false : true
//        
//        for element in values {
//            if isFirstElement {
//                url = url.appending("?")
//                isFirstElement = false
//            } else {
//                url = url.appending("&")
//            }
//            
//            url = url.appending("section=\(element.rawValue)")
//        }
//        
//        return url
//    }
//    
//    func page(_ page: Int, withSize pageSize: Int = 100) -> String {
//        let queryPattern = try! Regex(#".*\?.*"#)
//        var url: String = self.rawValue
//        
//        if let _ = try? queryPattern.firstMatch(in: url) {
//            url = url.appending("?")
//        } else {
//            url = url.appending("&")
//        }
//        
//        return url.appending("page=\(page)&page-size=\(pageSize)")
//    }
    
    func with(values: [String: String]? = nil, sections: [JpsApiSection]? = nil, page: Int? = nil, pageSize: Int = 100) -> String {
        var url: String = self.rawValue
        var isFirstElement: Bool = true
        var queryChar: String {
            return isFirstElement ? "?" : "&"
        }
        
        if let values = values {
            for element in values {
                url = url.replacingOccurrences(of: "{\(element.key)}", with: element.value)
            }
        }
        
        if let sections = sections {
            for element in sections {
                if isFirstElement {
                    url = url.appending(queryChar)
                    isFirstElement = false
                } else {
                    url = url.appending(queryChar)
                }
                
                url = url.appending("section=\(element.rawValue)")
            }
        }
        
        if let page = page {
            url = url.appending("\(queryChar)page=\(page)&page-size=\(pageSize)")
            isFirstElement = false
        }
        
        return url
    }
}
