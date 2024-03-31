//
//  ComputerMdmCapability.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerMdmCapability: Codable, Hashable {
    var capable: Bool
    var capableUsers: [String]
}
