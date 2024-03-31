//
//  ComputerDetailsGeneralView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/20/23.
//

import SwiftUI

struct ComputerDetailsGeneralView: View {
    var id: String
    var general: ComputerGeneral
    
    init(id: String, _ general: ComputerGeneral) {
        self.id = id
        self.general = general
    }
    
    var body: some View {
        Section(header: Text("General").font(.largeTitle)) {
            PropertyView(property: "Jamf Pro ID", value: id)
            PropertyView(property: "Management ID", value: general.managementId ?? "")
            PropertyView(property: "Asset Tag", value: general.assetTag ?? "")
            PropertyView(property: "Last Inventory Update", value: general.reportDate?.getRelativeAndCompleteString() ?? "")
            PropertyView(property: "Last Check-in", value: general.lastContactTime?.getRelativeAndCompleteString() ?? "")
            PropertyView(property: "IP Address", value: general.lastIpAddress ?? "")
            PropertyView(property: "Report IP Address", value: general.lastReportedIp ?? "")
            PropertyView(property: "Jamf Binary Version", value: general.jamfBinaryVersion ?? "")
            PropertyView(property: "Platform", value: general.platform ?? "")
            PropertyView(property: "Barcode 1", value: general.barcode1 ?? "")
            PropertyView(property: "Barcode 2", value: general.barcode2 ?? "")
            PropertyView(property: "Supervised", value: general.supervised?.description ?? "")
            PropertyView(property: "Last Cloud Backup", value: general.lastCloudBackupDate?.getRelativeAndCompleteString() ?? "")
            PropertyView(property: "Last Enrollment Date", value: general.lastEnrolledDate?.getRelativeAndCompleteString() ?? "")
            PropertyView(property: "Enrollment Method", value: general.enrollmentMethod?.objectName ?? "")
            PropertyView(property: "Enrolled Via Automated Device Enrollment", value: general.enrolledViaAutomatedDeviceEnrollment?.description ?? "")
            PropertyView(property: "MDM Profile Expiration", value: general.mdmProfileExpiration?.getRelativeAndCompleteString() ?? "")
            PropertyView(property: "Initial Entry Date", value: general.initialEntryDate?.getRelativeAndCompleteString() ?? "")
            PropertyView(property: "MDM Capable", value: general.mdmCapable?.capable.description ?? "")
            PropertyView(property: "MDM Capable Users", value: general.mdmCapable?.capableUsers.joined(separator: ", ") ?? "")
            PropertyView(property: "Distribution Point", value: general.distributionPoint ?? "")
            PropertyView(property: "Managed", value: general.remoteManagement?.managed?.description ?? "")
            PropertyView(property: "Management Username", value: general.remoteManagement?.managementUsername ?? "")
            PropertyView(property: "Site", value: general.site?.name ?? "")
            PropertyView(property: "iTunes Store Account Active", value: general.itunesStoreAccountActive?.description ?? "")
            PropertyView(property: "User Approved MDM", value: general.userApprovedMdm?.description ?? "")
            PropertyView(property: "Declarative Device Management Enabled", value: general.declarativeDeviceManagementEnabled?.description ?? "")
            
            if let extensionAttributes = general.extensionAttributes {
                if !extensionAttributes.isEmpty {
                    ComputerDetailsExtensionAttributeListView(extensionAttributes)
                }
            }
        }
    }
}

#Preview {
    return List {
        ComputerDetailsGeneralView(id: Computer.mockData!.id, Computer.mockData!.general!)
    }
}
