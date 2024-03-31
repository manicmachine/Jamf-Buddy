//
//  ComputerPartition.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerPartition: Codable, Hashable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let sizeMegabytes: Int64
    let availableMegabytes: Int64
    let partitionType: String
    let percentUsed: Int
    let fileVault2State: String
    let fileVault2ProgressPercent: Int
    let lvmManaged: Bool
    
    enum CodingKeys: String, CodingKey {
        case name
        case sizeMegabytes
        case availableMegabytes
        case partitionType
        case percentUsed
        case fileVault2State
        case fileVault2ProgressPercent
        case lvmManaged
    }
}
