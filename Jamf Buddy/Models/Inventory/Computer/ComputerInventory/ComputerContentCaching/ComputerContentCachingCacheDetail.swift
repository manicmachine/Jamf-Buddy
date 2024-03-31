//
//  ComputerContentCachingCacheDetail.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerContentCachingCacheDetail: Codable, Hashable {
    let computerContentCachingCacheDetailsId: String
    let categoryName: String?
    let diskSpaceBytesUsed: Int64?
}
