//
//  JpsApiQuery.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/18/23.
//

import Foundation

enum JpsApiSection: String {
    case general = "GENERAL"
    case diskEncryption = "DISK_ENCRYPTION"
    case purchasing = "PURCHASING"
    case applications = "APPLICATIONS"
    case storage = "STORAGE"
    case userAndLocation = "USER_AND_LOCATION"
    case configurationProfiles = "CONFIGURATION_PROFILES"
    case printers = "PRINTERS"
    case services = "SERVICES"
    case hardware = "HARDWARE"
    case localUserAccounts = "LOCAL_USER_ACCOUNTS"
    case certificates = "CERTIFICATES"
    case attachments = "ATTACHMENTS"
    case plugins = "PLUGINS"
    case packageReceipts = "PACKAGE_RECEIPTS"
    case fonts = "FONTS"
    case security = "SECURITY"
    case operatingSystem = "OPERATING_SYSTEM"
    case licensedSoftware = "LICENSED_SOFTWARE"
    case ibeacons = "IBEACONS"
    case softwareUpdates = "SOFTWARE_UPDATES"
    case extensionAttributes = "EXTENSION_ATTRIBUTES"
    case contentCaching = "CONTENT_CACHING"
    case groupMemberships = "GROUP_MEMBERSHIPS"
}
