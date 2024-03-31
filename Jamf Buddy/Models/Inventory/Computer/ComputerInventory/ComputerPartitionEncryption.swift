//
//  ComputerPartitionEncryption.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerPartitionEncryption: Codable, Hashable {
    var partitionName: String
    var partitionFileVault2State: String
    var partitionFileVault2Percent: Int
}
