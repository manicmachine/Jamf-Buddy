//
//  ComputerConfigurationProfile.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerConfigurationProfile: Codable, Hashable, Identifiable {
    let id: String?
    let username: String?
    let lastInstalled: Date?
    let removable: Bool?
    let displayName: String
    let profileIdentifier: String
}
