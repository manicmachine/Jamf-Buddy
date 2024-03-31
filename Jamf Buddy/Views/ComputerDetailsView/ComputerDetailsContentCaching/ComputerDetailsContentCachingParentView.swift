//
//  ComputerContentCachingParentView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import SwiftUI

struct ComputerDetailsContentCachingParentView: View {
    let parents: [ComputerContentCachingParent]
    
    init(_ parents: [ComputerContentCachingParent]) {
        self.parents = parents
    }
    
    var body: some View {
        List {
            ForEach(parents, id: \.contentCachingParentId) { parent in
                Section(header: Text("Parent \(parent.contentCachingParentId)")) {
                    if let alert = parent.alerts {
                        NavigationLink {
                            ComputerDetailsContentCachingParentAlertView(alert)
                        } label: {
                            PropertyView(property: nil, value: "Alert")
                        }
                        .navigationTitle("Parent \(parent.contentCachingParentId) Alert")
                    }

                    PropertyView(property: "GUID", value: parent.guid ?? "")
                    PropertyView(property: "Healthy", value: parent.healthy?.description ?? "")
                    PropertyView(property: "Address", value: parent.address ?? "")
                    PropertyView(property: "Port", value: parent.port?.formatted() ?? "")
                    PropertyView(property: "Version", value: parent.version ?? "")
                    
                    if let details = parent.details {
                        NavigationLink {
                            ComputerDetailsContentCachingParentDetailsView(details)
                        } label: {
                            PropertyView(property: nil, value: "Details")
                        }
                        .navigationTitle("Parent \(parent.contentCachingParentId) Details")
                    }
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsContentCachingParentView(Computer.mockData!.contentCaching!.parents!)
}
