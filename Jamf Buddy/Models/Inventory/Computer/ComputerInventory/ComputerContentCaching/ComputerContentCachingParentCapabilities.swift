//
//  ComputerContentCachingParentCapabilities.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerContentCachingParentCapabilities: Codable, Hashable {
    let contentCachingParentCapabilitiesId: String?
    let imports: Bool?
    let namespaces: Bool?
    let personalContent: Bool?
    let queryParameters: Bool?
    let sharedContent: Bool?
    let prioritization: Bool?
}
