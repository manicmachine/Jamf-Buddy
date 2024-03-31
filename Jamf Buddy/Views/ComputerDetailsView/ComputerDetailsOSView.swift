//
//  ComputerDetailsOSView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/21/23.
//

import SwiftUI

struct ComputerDetailsOSView: View {
    let operatingSystem: ComputerOperatingSystem
    
    init(_ operatingSystem: ComputerOperatingSystem) {
        self.operatingSystem = operatingSystem
    }
    
    var body: some View {
        Section(header:
                    Text("Operating System")
            .font(.largeTitle)
            .scaledToFit()
            .minimumScaleFactor(0.5)
        ) {
            PropertyView(property: "Operating System", value: operatingSystem.name)
            PropertyView(property: "Operating System Version", value: operatingSystem.version ?? "")
            PropertyView(property: "Operating System Build", value: operatingSystem.build ?? "")
            PropertyView(property: "Operating System Supplemental Build Version", value: operatingSystem.supplementalBuildVersion ?? "")
            PropertyView(property: "Operating System Rapid Security Response", value: operatingSystem.rapidSecurityResponse ?? "")
            PropertyView(property: "Active Directory Status", value: operatingSystem.activeDirectoryStatus ?? "")
            PropertyView(property: "FileVault 2 Status", value: operatingSystem.fileVault2Status ?? "")
            
            if let extensionAttributes = operatingSystem.extensionAttributes {
                if !extensionAttributes.isEmpty {
                    ComputerDetailsExtensionAttributeListView(extensionAttributes)
                }
            }
        }
    }
}

#Preview {
    return List {
        ComputerDetailsOSView(Computer.mockData!.operatingSystem!)
    }
}
