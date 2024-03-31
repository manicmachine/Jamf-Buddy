//
//  ComputerRemoteManagement.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/12/23.
//

import Foundation

struct ComputerRemoteManagement: Codable, Hashable {
    var managed: Bool?
    var managementUsername: String?
    var managementPassword: String?
}
