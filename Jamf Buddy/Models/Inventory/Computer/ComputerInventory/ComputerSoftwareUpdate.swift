//
//  ComputerSoftwareUpdate.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerSoftwareUpdate: Codable, Hashable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let version: String?
    let packageName: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case version
        case packageName
    }
}
