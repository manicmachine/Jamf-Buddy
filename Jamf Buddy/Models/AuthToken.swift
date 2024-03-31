//
//  AuthToken.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 11/10/23.
//

import Foundation

struct AuthToken: Codable {
    let token: String
    let expires: Date
    let issueTime: Date = Date()
    
    var renewalInterval: TimeInterval { return self.expires.timeIntervalSince1970 - self.issueTime.timeIntervalSince1970 }
    var isExpired: Bool { return self.expires.timeIntervalSince1970 < Date().timeIntervalSince1970 }
}
