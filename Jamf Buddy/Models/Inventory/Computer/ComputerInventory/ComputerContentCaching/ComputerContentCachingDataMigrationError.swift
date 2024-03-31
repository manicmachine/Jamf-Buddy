//
//  ComputerContentCachingDataMigrationError.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerContentCachingDataMigrationError: Codable, Hashable {
    let code: Int64
    let domain: String?
    let userInfo: [ComputerContentCachingDataMigrationErrorUserInfo]?
}
