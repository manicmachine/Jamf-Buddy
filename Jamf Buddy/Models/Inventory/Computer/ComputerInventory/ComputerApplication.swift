//
//  ComputerApplication.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerApplication: Codable, Hashable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let path: String?
    let version: String?
    let macAppStore: Bool?
    let sizeMegabytes: Int?
    let bundleId: String?
    let updateAvailable: Bool?
    let externalVersionId: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case path
        case version
        case macAppStore
        case sizeMegabytes
        case bundleId
        case updateAvailable
        case externalVersionId
    }
}
