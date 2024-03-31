//
//  ComputerContentCachingParent.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerContentCachingParent: Codable, Hashable {
    let contentCachingParentId: String
    let address: String?
    let alerts: ComputerContentCachingParentAlert?
    let details: ComputerContentCachingParentDetails?
    let guid: String?
    let healthy: Bool?
    let port: Int64?
    let version: String?
}
