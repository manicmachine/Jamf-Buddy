//
//  ComputerDetailsSoftwareUpdatesListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import SwiftUI

struct ComputerDetailsSoftwareUpdatesListView: View {
    let updates: [ComputerSoftwareUpdate]
    
    init(_ updates: [ComputerSoftwareUpdate]) {
        self.updates = updates.sorted { $0.name < $1.name }
    }

    var body: some View {
        List {
            Section {
                ForEach(updates) { update in
                    VStack(alignment: .leading) {
                        PropertyView(property: "Name", value: update.name)
                        PropertyView(property: "Version", value: update.version ?? "")
                        PropertyView(property: "Package Name", value: update.packageName ?? "")
                    }
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsSoftwareUpdatesListView(Computer.mockData!.softwareUpdates!)
}
