//
//  GroupMembership.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct GroupMembership: Codable, Hashable {
    let groupId: String
    let groupName: String
    let smartGroup: Bool
}
