//
//  ComputerDiskEncryption.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerDiskEncryption: Codable, Hashable {
    var bootPartitionEncryptionDetails: ComputerPartitionEncryption?
    var individualRecoveryKeyValidityStatus: String?
    var institutionalRecoveryKeyPresent: Bool?
    var diskEncryptionConfigurationName: String?
    var fileVault2EnabledUserNames: [String]?
    var fileVault2EligibilityMessage: String?
}
