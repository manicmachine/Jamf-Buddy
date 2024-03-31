//
//  ComputerHardware.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerHardware: Codable, Hashable, Searchable {
    let make: String?
    let model: String?
    let modelIdentifier: String?
    let serialNumber: String?
    let processorSpeedMhz: Int?
    let processorCount: Int?
    let coreCount: Int?
    let processorType: String?
    let processorArchitecture: String?
    let busSpeedMhz: Int?
    let cacheSizeKilobytes: Int?
    let networkAdapterType: String?
    let macAddress: String?
    let altNetworkAdapterType: String?
    let altMacAddress: String?
    let totalRamMegabytes: Int?
    let openRamSlots: Int?
    let batteryCapacityPercent: Int?
    let smcVersion: String?
    let nicSpeed: String?
    let opticalDrive: String?
    let bootRom: String?
    let bleCapable: Bool?
    let supportsIosAppInstalls: Bool?
    let appleSilicon: Bool?
    let extensionAttributes: [ComputerExtensionAttribute]?
}
