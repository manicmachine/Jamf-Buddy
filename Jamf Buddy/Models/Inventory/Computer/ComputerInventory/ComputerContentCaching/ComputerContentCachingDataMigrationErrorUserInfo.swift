//
//  ComputerContentCachingDataMigrationErrorUserInfo.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerContentCachingDataMigrationErrorUserInfo: Codable, Hashable, Identifiable {
    let id: UUID = UUID()
    let key: String
    let value: String?
    
    enum CodingKeys: String, CodingKey {
        case key
        case value
    }
}
