//
//  Dashboard.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 1/4/24.
//

import Foundation

struct Dashboard: Codable {
    var setupTaskOptions: [String: DashboardSetupTask]
    var featureOptions: [String: [DashboardItem]]
}

struct DashboardApiError: Codable, Equatable, Hashable {
    var httpStatusCode: Int
    var id: String
    var description: String
}

struct DashboardMetric: Codable, Equatable, Hashable {
    var value: String
    var enabled: Bool
    var tag: String
    
    func getValue() -> Int {
        if let val = Int(self.value) {
            return val
        } else {
            return 0
        }
    }
}

struct DashboardDetail: Codable, Equatable, Hashable {
    var label: String
    var value: String
    
    func getValue() -> Int {
        if let val = Int(self.value) {
            return val
        } else {
            return 0
        }
    }
}

struct DashboardItem: Codable, Identifiable, Hashable {
    var id: String
    var title: String?
    var subtitle: String?
    var info: String?
    var enabled: Bool
    var metrics: [DashboardMetric]
    var details: [DashboardDetail]
    var error: DashboardApiError?
    
    static func == (lhs: DashboardItem, rhs: DashboardItem) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.subtitle == rhs.subtitle &&
        lhs.info == rhs.info &&
        lhs.enabled == rhs.enabled &&
        lhs.metrics == rhs.metrics &&
        lhs.details == rhs.details &&
        lhs.error == rhs.error
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(subtitle)
        hasher.combine(info)
        hasher.combine(enabled)
        hasher.combine(metrics)
        hasher.combine(details)
        hasher.combine(error)
    }
}

struct DashboardSetupTask: Codable {
    var available: Bool
    var error: DashboardApiError?
}

struct DashboardMetricWrapper: Codable, Hashable, Equatable {
    let label: String
    let value: Int
    
    init(_ metric: DashboardMetric) {
        self.label = metric.tag
        self.value = metric.getValue()
    }
    
    init(_ detail: DashboardDetail) {
        self.label = detail.label
        self.value = detail.getValue()
    }
}

enum DashboardMetricType {
    case general
    case detailed
}

// MARK: Extensions

#if DEBUG
extension Dashboard {
    static let mockData: Dashboard? = {
        if let path = Bundle.main.path(forResource: "MockDashboardData", ofType: "json") {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                
                // Decode the JSON data
                let decoder = JSONDecoder()
                
                return try decoder.decode(Dashboard.self, from: data)
            } catch {
                // Handle error while reading or decoding JSON
                print("Error reading JSON file: \(error)")
                return nil
            }
        } else {
            print("JSON file not found.")
            return nil
        }
    }()
}
#endif
