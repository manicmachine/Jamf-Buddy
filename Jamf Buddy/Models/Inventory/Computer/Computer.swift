//
//  Computer.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 11/10/23.
//

import Foundation

@Observable class Computer: Codable, Identifiable, Searchable {
    var id: String
    var udid: String
    var general: ComputerGeneral?
    var diskEncryption: ComputerDiskEncryption?
    var purchasing: ComputerPurchase?
    var applications: [ComputerApplication]?
    var storage: ComputerStorage?
    var userAndLocation: ComputerUserAndLocation?
    var configurationProfiles: [ComputerConfigurationProfile]?
    var printers: [ComputerPrinter]?
    var services: [ComputerService]?
    var hardware: ComputerHardware?
    var localUserAccounts: [ComputerLocalUserAccount]?
    var certificates: [ComputerCertificate]?
    var attachments: [ComputerAttachment]?
    var plugins: [ComputerPlugin]?
    var packageReceipts: ComputerPackageReceipts?
    var fonts: [ComputerFont]?
    var security: ComputerSecurity?
    var operatingSystem: ComputerOperatingSystem?
    var licensedSoftware: [ComputerLicensedSoftware]?
    var ibeacons: [ComputerIbeacon]?
    var softwareUpdates: [ComputerSoftwareUpdate]?
    var extensionAttributes: [ComputerExtensionAttribute]?
    var contentCaching: ComputerContentCaching?
    var groupMemberships: [GroupMembership]?
    
    init(id: String,
         udid: String,
         general: ComputerGeneral? = nil,
         diskEncryption: ComputerDiskEncryption? = nil,
         purchasing: ComputerPurchase? = nil,
         applications: [ComputerApplication]? = nil,
         storage: ComputerStorage? = nil,
         userAndLocation: ComputerUserAndLocation? = nil,
         configurationProfiles: [ComputerConfigurationProfile]? = nil,
         printers: [ComputerPrinter]? = nil,
         services: [ComputerService]? = nil,
         hardware: ComputerHardware? = nil,
         localUserAccounts: [ComputerLocalUserAccount]? = nil,
         certificates: [ComputerCertificate]? = nil,
         attachments: [ComputerAttachment]? = nil,
         plugins: [ComputerPlugin]? = nil,
         packageReceipts: ComputerPackageReceipts? = nil,
         fonts: [ComputerFont]? = nil,
         security: ComputerSecurity? = nil,
         operatingSystem: ComputerOperatingSystem? = nil,
         licensedSoftware: [ComputerLicensedSoftware]? = nil,
         ibeacons: [ComputerIbeacon]? = nil,
         softwareUpdates: [ComputerSoftwareUpdate]? = nil,
         extensionAttributes: [ComputerExtensionAttribute]? = nil,
         contentCaching: ComputerContentCaching? = nil,
         groupMemberships: [GroupMembership]? = nil) {
        self.id = id
        self.udid = udid
        self.general = general
        self.diskEncryption = diskEncryption
        self.purchasing = purchasing
        self.applications = applications
        self.storage = storage
        self.userAndLocation = userAndLocation
        self.configurationProfiles = configurationProfiles
        self.printers = printers
        self.services = services
        self.hardware = hardware
        self.localUserAccounts = localUserAccounts
        self.certificates = certificates
        self.attachments = attachments
        self.plugins = plugins
        self.packageReceipts = packageReceipts
        self.fonts = fonts
        self.security = security
        self.operatingSystem = operatingSystem
        self.licensedSoftware = licensedSoftware
        self.ibeacons = ibeacons
        self.softwareUpdates = softwareUpdates
        self.extensionAttributes = extensionAttributes
        self.contentCaching = contentCaching
        self.groupMemberships = groupMemberships
    }
    
    static func == (lhs: Computer, rhs: Computer) -> Bool {
        return lhs.id == rhs.id && lhs.udid == rhs.udid
    }
    
    func getModelIconName() -> String {
        return ModelIconHelper.getIcon(for: self.hardware?.modelIdentifier)
    }
    
    func update(from computer: Computer) {
        self.general = computer.general
        self.diskEncryption = computer.diskEncryption
        self.purchasing = computer.purchasing
        self.applications = computer.applications
        self.storage = computer.storage
        self.userAndLocation = computer.userAndLocation
        self.configurationProfiles = computer.configurationProfiles
        self.printers = computer.printers
        self.services = computer.services
        self.hardware = computer.hardware
        self.localUserAccounts = computer.localUserAccounts
        self.certificates = computer.certificates
        self.attachments = computer.attachments
        self.plugins = computer.plugins
        self.packageReceipts = computer.packageReceipts
        self.fonts = computer.fonts
        self.security = computer.security
        self.operatingSystem = computer.operatingSystem
        self.licensedSoftware = computer.licensedSoftware
        self.ibeacons = computer.ibeacons
        self.softwareUpdates = computer.softwareUpdates
        self.extensionAttributes = computer.extensionAttributes
        self.contentCaching = computer.contentCaching
        self.groupMemberships = computer.groupMemberships
    }
    
    // MARK: Codable
    enum CodingKeys: String, CodingKey {
        case id
        case udid
        case general
        case diskEncryption
        case purchasing
        case applications
        case storage
        case userAndLocation
        case configurationProfiles
        case printers
        case services
        case hardware
        case localUserAccounts
        case certificates
        case attachments
        case plugins
        case packageReceipts
        case fonts
        case security
        case operatingSystem
        case licensedSoftware
        case ibeacons
        case softwareUpdates
        case extensionAttributes
        case contentCaching
        case groupMemberships
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        udid = try container.decode(String.self, forKey: .udid)
        general = try container.decodeIfPresent(ComputerGeneral.self, forKey: .general)
        diskEncryption = try container.decodeIfPresent(ComputerDiskEncryption.self, forKey: .diskEncryption)
        purchasing = try container.decodeIfPresent(ComputerPurchase.self, forKey: .purchasing)
        applications = try container.decodeIfPresent([ComputerApplication].self, forKey: .applications)
        storage = try container.decodeIfPresent(ComputerStorage.self, forKey: .storage)
        userAndLocation = try container.decodeIfPresent(ComputerUserAndLocation.self, forKey: .userAndLocation)
        configurationProfiles = try container.decodeIfPresent([ComputerConfigurationProfile].self, forKey: .configurationProfiles)
        printers = try container.decodeIfPresent([ComputerPrinter].self, forKey: .printers)
        services = try container.decodeIfPresent([ComputerService].self, forKey: .services)
        hardware = try container.decodeIfPresent(ComputerHardware.self, forKey: .hardware)
        localUserAccounts = try container.decodeIfPresent([ComputerLocalUserAccount].self, forKey: .localUserAccounts)
        certificates = try container.decodeIfPresent([ComputerCertificate].self, forKey: .certificates)
        attachments = try container.decodeIfPresent([ComputerAttachment].self, forKey: .attachments)
        plugins = try container.decodeIfPresent([ComputerPlugin].self, forKey: .plugins)
        packageReceipts = try container.decodeIfPresent(ComputerPackageReceipts.self, forKey: .packageReceipts)
        fonts = try container.decodeIfPresent([ComputerFont].self, forKey: .fonts)
        security = try container.decodeIfPresent(ComputerSecurity.self, forKey: .security)
        operatingSystem = try container.decodeIfPresent(ComputerOperatingSystem.self, forKey: .operatingSystem)
        licensedSoftware = try container.decodeIfPresent([ComputerLicensedSoftware].self, forKey: .licensedSoftware)
        ibeacons = try container.decodeIfPresent([ComputerIbeacon].self, forKey: .ibeacons)
        softwareUpdates = try container.decodeIfPresent([ComputerSoftwareUpdate].self, forKey: .softwareUpdates)
        extensionAttributes = try container.decodeIfPresent([ComputerExtensionAttribute].self, forKey: .extensionAttributes)
        contentCaching = try container.decodeIfPresent(ComputerContentCaching.self, forKey: .contentCaching)
        groupMemberships = try container.decodeIfPresent([GroupMembership].self, forKey: .groupMemberships)
    }
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)

            try container.encode(id, forKey: .id)
            try container.encode(udid, forKey: .udid)
            try container.encodeIfPresent(general, forKey: .general)
            try container.encodeIfPresent(diskEncryption, forKey: .diskEncryption)
            try container.encodeIfPresent(purchasing, forKey: .purchasing)
            try container.encodeIfPresent(applications, forKey: .applications)
            try container.encodeIfPresent(storage, forKey: .storage)
            try container.encodeIfPresent(userAndLocation, forKey: .userAndLocation)
            try container.encodeIfPresent(configurationProfiles, forKey: .configurationProfiles)
            try container.encodeIfPresent(printers, forKey: .printers)
            try container.encodeIfPresent(services, forKey: .services)
            try container.encodeIfPresent(hardware, forKey: .hardware)
            try container.encodeIfPresent(localUserAccounts, forKey: .localUserAccounts)
            try container.encodeIfPresent(certificates, forKey: .certificates)
            try container.encodeIfPresent(attachments, forKey: .attachments)
            try container.encodeIfPresent(plugins, forKey: .plugins)
            try container.encodeIfPresent(packageReceipts, forKey: .packageReceipts)
            try container.encodeIfPresent(fonts, forKey: .fonts)
            try container.encodeIfPresent(security, forKey: .security)
            try container.encodeIfPresent(operatingSystem, forKey: .operatingSystem)
            try container.encodeIfPresent(licensedSoftware, forKey: .licensedSoftware)
            try container.encodeIfPresent(ibeacons, forKey: .ibeacons)
            try container.encodeIfPresent(softwareUpdates, forKey: .softwareUpdates)
            try container.encodeIfPresent(extensionAttributes, forKey: .extensionAttributes)
            try container.encodeIfPresent(contentCaching, forKey: .contentCaching)
            try container.encodeIfPresent(groupMemberships, forKey: .groupMemberships)
        }
}

// MARK: Extensions
extension Computer: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(udid)
        hasher.combine(general)
        hasher.combine(diskEncryption)
        hasher.combine(purchasing)
        hasher.combine(applications)
        hasher.combine(storage)
        hasher.combine(userAndLocation)
        hasher.combine(configurationProfiles)
        hasher.combine(printers)
        hasher.combine(services)
        hasher.combine(hardware)
        hasher.combine(localUserAccounts)
        hasher.combine(certificates)
        hasher.combine(attachments)
        hasher.combine(plugins)
        hasher.combine(packageReceipts)
        hasher.combine(fonts)
        hasher.combine(security)
        hasher.combine(operatingSystem)
        hasher.combine(licensedSoftware)
        hasher.combine(ibeacons)
        hasher.combine(softwareUpdates)
        hasher.combine(extensionAttributes)
        hasher.combine(contentCaching)
        hasher.combine(groupMemberships)
    }
}

// MARK: Extensions

#if DEBUG
extension Computer {
    static let mockData: Computer? = {
        if let path = Bundle.main.path(forResource: "MockComputerData", ofType: "json") {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                
                // Decode the JSON data
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(.iso8601)
                
                return try! decoder.decode(Computer.self, from: data)
            } catch {
                // Handle error while reading or decoding JSON
                print("Error reading JSON file: \(error)")
                return nil
            }
        } else {
            print("JSON file not found.")
            return nil
        }
    }()
}
#endif
