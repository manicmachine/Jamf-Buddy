//
//  ComputerContentCachingParentDetails.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerContentCachingParentDetails: Codable, Hashable {
    let contentCachingParentDetailsId: String
    let acPower: Bool?
    let cacheSizeBytes: Int64?
    let capabilities: ComputerContentCachingParentCapabilities?
    let portable: Bool?
    let localNetwork: [ComputerContentCachingParentLocalNetwork]?
}
