//
//  ComputerCertificate.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerCertificate: Codable, Hashable, Identifiable {
    let id: UUID = UUID()
    let commonName: String
    let identity: Bool?
    let expirationDate: Date?
    let username: String?
    let lifecycleStatus: String?
    let certificateStatus: String?
    let subjectName: String?
    let serialNumber: String?
    let sha1Fingerprint: String?
    let issuedDate: Date?
    
    enum CodingKeys: String, CodingKey {
        case commonName
        case identity
        case expirationDate
        case username
        case lifecycleStatus
        case certificateStatus
        case subjectName
        case serialNumber
        case sha1Fingerprint
        case issuedDate
    }
}
