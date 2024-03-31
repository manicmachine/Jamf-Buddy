//
//  ComputerPurchase.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerPurchase: Codable, Hashable {
    let leased: Bool?
    let purchased: Bool?
    let poNumber: String?
    let poDate: Date?
    let vendor: String?
    let warrantyDate: Date?
    let appleCareId: String?
    let leaseDate: Date?
    let purchasePrice: String?
    let lifeExpectancy: Int?
    let purchasingAccount: String?
    let purchasingContact: String?
    let extensionAttributes: [ComputerExtensionAttribute]?
}
