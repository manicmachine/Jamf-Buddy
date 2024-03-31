//
//  ComputerDetailsSecurityView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/21/23.
//

import SwiftUI

struct ComputerDetailsSecurityView: View {
    let security: ComputerSecurity

    init(_ security: ComputerSecurity) {
        self.security = security
    }

    var body: some View {
        Section(header:
            Text("Security")
            .font(.largeTitle)
            .scaledToFit()
            .minimumScaleFactor(0.5)
        ) {
            PropertyView(property: "System Integrity Protection", value: security.sipStatus ?? "")
            PropertyView(property: "Gatekeeper", value: security.gatekeeperStatus ?? "")
            PropertyView(property: "XProtect Definitions Version", value: security.xprotectVersion ?? "")
            PropertyView(property: "Automatic Login Disabled", value: security.autoLoginDisabled?.description ?? "")
            PropertyView(property: "Remote Desktop Enabled", value: security.remoteDesktopEnabled?.description ?? "")
            PropertyView(property: "Activation Lock Enabled", value: security.activationLockEnabled?.description ?? "")
            PropertyView(property: "Recovery Lock Enabled", value: security.recoveryLockEnabled?.description ?? "")
            PropertyView(property: "Secure Boot Level", value: security.secureBootLevel ?? "")
            PropertyView(property: "External Boot Level", value: security.externalBootLevel ?? "")
            PropertyView(property: "Bootstrap Token Allowed", value: security.bootstrapTokenAllowed?.description ?? "")
            PropertyView(property: "Bootstrap Token Escrowed", value: security.bootstrapTokenEscrowedStatus ?? "")
            PropertyView(property: "Firewall Enabled", value: security.firewallEnabled?.description ?? "")
        }
    }
}

#Preview {
    return List {
        ComputerDetailsSecurityView(Computer.mockData!.security!)
    }
}
