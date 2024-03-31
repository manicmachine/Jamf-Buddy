//
//  ComputerFont.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerFont: Codable, Hashable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let version: String?
    let path: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case version
        case path
    }
}
