//
//  ComputerPrinter.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerPrinter: Codable, Hashable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let type: String?
    let uri: String?
    let location: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case uri
        case location
    }
}
