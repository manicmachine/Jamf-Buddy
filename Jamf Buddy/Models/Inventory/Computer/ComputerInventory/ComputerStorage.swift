//
//  ComputerStorage.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerStorage: Codable, Hashable {
    let bootDriveAvailableSpaceMegabytes: Int64?
    let disks: [ComputerDisk]?
}
