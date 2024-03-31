//
//  ComputerOperatingSystem.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerOperatingSystem: Codable, Hashable {
    let name: String
    let version: String?
    let build: String?
    let supplementalBuildVersion: String?
    let rapidSecurityResponse: String?
    let activeDirectoryStatus: String?
    let fileVault2Status: String?
    let softwareUpdateDeviceId: String?
    let extensionAttributes: [ComputerExtensionAttribute]?
}
