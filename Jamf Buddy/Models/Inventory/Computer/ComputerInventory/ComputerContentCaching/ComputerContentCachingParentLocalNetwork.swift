//
//  ComputerContentCachingParentLocalNetwork.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerContentCachingParentLocalNetwork: Codable, Hashable {
    let contentCachingParentLocalNetworkId: String
    let speed: Int64?
    let wired: Bool?
}
