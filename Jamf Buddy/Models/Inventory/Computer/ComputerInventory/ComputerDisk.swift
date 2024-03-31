//
//  ComputerDisk.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerDisk: Codable, Hashable {
    let id: String?
    let device: String?
    let model: String?
    let revision: String?
    let serialNumber: String?
    let sizeMegabytes: Int64?
    let smartStatus: String?
    let type: String?
    let partitions: [ComputerPartition]
}
