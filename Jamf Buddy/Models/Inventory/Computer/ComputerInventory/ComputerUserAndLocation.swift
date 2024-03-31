//
//  ComputerUserAndLocation.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerUserAndLocation: Codable, Hashable {
    let username: String?
    let realname: String?
    let email: String?
    let position: String?
    let phone: String?
    let departmentId: String?
    let buildingId: String?
    let room: String?
    let extensionAttributes: [ComputerExtensionAttribute]?
}
