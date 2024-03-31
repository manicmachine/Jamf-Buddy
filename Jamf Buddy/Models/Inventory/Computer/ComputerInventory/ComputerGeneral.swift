//
//  ComputerGeneral.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerGeneral: Codable, Hashable, Searchable {
    var name: String
    var lastIpAddress: String?
    var lastReportedIp: String?
    var jamfBinaryVersion: String?
    var platform: String?
    var barcode1: String?
    var barcode2: String?
    var assetTag: String?
    var remoteManagement: ComputerRemoteManagement?
    var supervised: Bool?
    var mdmCapable: ComputerMdmCapability?
    var reportDate: Date?
    var lastContactTime: Date?
    var lastCloudBackupDate: Date?
    var lastEnrolledDate: Date?
    var mdmProfileExpiration: Date?
    var initialEntryDate: Date?
    var distributionPoint: String?
    var enrollmentMethod: EnrollmentMethod?
    var site: V1Site?
    var itunesStoreAccountActive: Bool?
    var enrolledViaAutomatedDeviceEnrollment: Bool?
    var userApprovedMdm: Bool?
    var declarativeDeviceManagementEnabled: Bool?
    var extensionAttributes: [ComputerExtensionAttribute]?
    var managementId: String?
}
