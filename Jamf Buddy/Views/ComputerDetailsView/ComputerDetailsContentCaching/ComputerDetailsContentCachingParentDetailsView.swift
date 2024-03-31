//
//  ComputerDetailsContentCachingParentDetailsView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import SwiftUI

struct ComputerDetailsContentCachingParentDetailsView: View {
    let details: ComputerContentCachingParentDetails
    
    init(_ details: ComputerContentCachingParentDetails) {
        self.details = details
    }
    
    var body: some View {
        List {
            Section(header: Text("Parent Details \(details.contentCachingParentDetailsId)")) {
                PropertyView(property: "AC Power", value: details.acPower?.description ?? "")
                PropertyView(property: "Cache Size MB", value: details.cacheSizeBytes?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Portable", value: details.portable?.description ?? "")
            }
            
            if let capabilities = details.capabilities {
                Section(header: Text("Capabilities")) {
                    PropertyView(property: "Imports", value: capabilities.imports?.description ?? "")
                    PropertyView(property: "Namespaces", value: capabilities.namespaces?.description ?? "")
                    PropertyView(property: "Personal Content", value: capabilities.personalContent?.description ?? "")
                    PropertyView(property: "Query Parameters", value: capabilities.queryParameters?.description ?? "")
                    PropertyView(property: "Shared Content", value: capabilities.sharedContent?.description ?? "")
                    PropertyView(property: "Prioritization", value: capabilities.prioritization?.description ?? "")
                }
            }
            
            if let localNetwork = details.localNetwork {
                Section(header: Text("Local Network")) {
                    ForEach(localNetwork, id: \.contentCachingParentLocalNetworkId) { network in
                        HStack(alignment: .top) {
                            PropertyView(property: "ID", value: network.contentCachingParentLocalNetworkId)
                            Spacer()
                            PropertyView(property: "Speed", value: network.speed?.formatted(.number) ?? "")
                            Spacer()
                            PropertyView(property: "Wired", value: network.wired?.description ?? "")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsContentCachingParentDetailsView(Computer.mockData!.contentCaching!.parents![0].details!)
}
