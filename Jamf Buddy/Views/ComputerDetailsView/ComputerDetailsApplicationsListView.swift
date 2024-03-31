//
//  ComputerDetailsApplicationsListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/26/23.
//

import SwiftUI

struct ComputerDetailsApplicationsListView: View {
    #if os(iOS)
        @Environment(\.horizontalSizeClass) private var horizontalSizeClass
        private var isCompact: Bool { horizontalSizeClass == .compact }
    #else
        private let isCompact = false
    #endif

    @State private var sortOrder = [KeyPathComparator(\ComputerApplication.name)]
    let applications: [ComputerApplication]
    
    init(_ applications: [ComputerApplication]) {
        self.applications = applications.sorted { $0.name < $1.name }
    }
    
    var body: some View {
        Table(applications, sortOrder: $sortOrder) {
            TableColumn("Name", value: \.name) { app in
                VStack(alignment: .leading) {
                    PropertyView(property: "Name", value: app.name)
                        .scaledToFill()
                        .padding(.bottom)
                    
                    if isCompact {
                        HStack(alignment: .top) {
                            PropertyView(property: "Version", value: app.version ?? "")
                            Spacer()
                            PropertyView(property: "Size MB", value: app.sizeMegabytes?.description ?? "")
                            Spacer()
                            PropertyView(property: "Mac App Store", value: app.macAppStore?.description ?? "")
                        }
                        
                        PropertyView(property: "Bundle ID", value: app.bundleId ?? "")
                        PropertyView(property: "Path", value: app.path ?? "", allowScrolling: true)
                    }
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsApplicationsListView(Computer.mockData!.applications!)
}
