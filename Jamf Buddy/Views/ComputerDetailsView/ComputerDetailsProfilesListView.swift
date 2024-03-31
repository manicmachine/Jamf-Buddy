//
//  ComputerDetailsProfilesListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/27/23.
//

import SwiftUI

struct ComputerDetailsProfilesListView: View {
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    private var isCompact: Bool { horizontalSizeClass == .compact }
#else
    private let isCompact = false
#endif
    
    @State private var sortOrder = [KeyPathComparator(\ComputerConfigurationProfile.displayName)]
    
    let profiles: [ComputerConfigurationProfile]
    
    init(_ profiles: [ComputerConfigurationProfile]) {
        self.profiles = profiles.sorted { $0.displayName < $1.displayName }
    }
    
    var body: some View {
        Table(profiles, sortOrder: $sortOrder) {
            TableColumn("Name", value: \.displayName) { profile in
                VStack(alignment: .leading) {
                    PropertyView(property: "Display Name", value: profile.displayName)
                    
                    if isCompact {
                        PropertyView(property: "Profile Identifier", value: profile.profileIdentifier)
                        PropertyView(property: "Last Installed", value: profile.lastInstalled?.getRelativeAndCompleteString() ?? "")
                        PropertyView(property: "Removable", value: profile.removable?.description ?? "")
                        PropertyView(property: "Username", value: profile.username ?? "")
                    }
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsProfilesListView(Computer.mockData!.configurationProfiles!)
}
