//
//  ComputerAttachment.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerAttachment: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let fileType: String?
    let sizeBytes: Int64?
}
