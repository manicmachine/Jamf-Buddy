//
//  User.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 11/10/23.
//

import Foundation
import SwiftData

class User {
    @Attribute(.unique) var id: Int
    var name: String
    var computers: [Computer] = []
    var mobileDevices: [MobileDevice] = []

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
