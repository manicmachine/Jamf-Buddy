//
//  ComputerContentCachingParentAlert.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerContentCachingParentAlert: Codable, Hashable {
    let contentCachingParentAlertId: String
    let addresses: [String]?
    let className: String?
    let postDate: Date?
}
