//
//  ComputerDetailsDiskEncryptionView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/26/23.
//

import SwiftUI

struct ComputerDetailsDiskEncryptionView: View {
    let diskEncryption: ComputerDiskEncryption

    init(_ diskEncryption: ComputerDiskEncryption) {
        self.diskEncryption = diskEncryption
    }

    var body: some View {
        Section(header:
            Text("Disk Encryption")
            .font(.largeTitle)
            .scaledToFit()
            .minimumScaleFactor(0.5)
        ) {
            PropertyView(property: "Name", value: diskEncryption.bootPartitionEncryptionDetails?.partitionName ?? "")
            PropertyView(property: "FileVault 2 State", value: diskEncryption.bootPartitionEncryptionDetails?.partitionFileVault2State ?? "")
            PropertyView(property: "Personal Recovery Key Validation", value: diskEncryption.individualRecoveryKeyValidityStatus ?? "")
            PropertyView(property: "Institutional Recovery Key Status", value: diskEncryption.institutionalRecoveryKeyPresent?.description ?? "")
            PropertyView(property: "Disk Encryption Configuration", value: diskEncryption.diskEncryptionConfigurationName ?? "")
            PropertyView(property: "FileVault 2 Enabled Users", value: diskEncryption.fileVault2EnabledUserNames?.joined(separator: ", ") ?? "")
            
        }
    }
}

#Preview {
    List {
        ComputerDetailsDiskEncryptionView(Computer.mockData!.diskEncryption!)
    }
}
