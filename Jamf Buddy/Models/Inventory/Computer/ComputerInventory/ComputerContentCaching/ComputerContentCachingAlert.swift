//
//  ComputerContentCachingAlert.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerContentCachingAlert: Codable, Hashable, Identifiable {
    let id: UUID = UUID()
    let cacheBytesLimit: Int64?
    let className: String?
    let pathPreventingAccess: String?
    let postDate: Date
    let reservedVolumeBytes: Int64?
    let resource: String?
    
    enum CodingKeys: String, CodingKey {
        case cacheBytesLimit
        case className
        case pathPreventingAccess
        case postDate
        case reservedVolumeBytes
        case resource
    }
}
