//
//  ComputerSecurity.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerSecurity: Codable, Hashable {
    let sipStatus: String?
    let gatekeeperStatus: String?
    let xprotectVersion: String?
    let autoLoginDisabled: Bool?
    let remoteDesktopEnabled: Bool?
    let activationLockEnabled: Bool?
    let recoveryLockEnabled: Bool?
    let firewallEnabled: Bool?
    let secureBootLevel: String?
    let externalBootLevel: String?
    let bootstrapTokenAllowed: Bool?
    let bootstrapTokenEscrowedStatus: String?
}
