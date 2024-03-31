//
//  ComputerDetailsPartitionsView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/26/23.
//

import SwiftUI

struct ComputerDetailsPartitionsListView: View {
    #if os(iOS)
        @Environment(\.horizontalSizeClass) private var horizontalSizeClass
        private var isCompact: Bool { horizontalSizeClass == .compact }
    #else
        private let isCompact = false
    #endif
    
    @State private var sortOrder = [KeyPathComparator(\ComputerPartition.name)]
    var partitions: [ComputerPartition]

    init(_ partitions: [ComputerPartition]) {
        self.partitions = partitions
    }

    var body: some View {
        Table(partitions, sortOrder: $sortOrder) {
            TableColumn("Name", value: \.name) { partition in
                VStack(alignment: .leading) {
                    PropertyView(property: "Name", value: partition.name)
                        .padding(.bottom)
                    
                    if isCompact {
                        HStack {
                            VStack(alignment: .leading) {
                                PropertyView(property: "Size MB", value: partition.sizeMegabytes.description)
                                PropertyView(property: "FV State", value: partition.fileVault2State)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                PropertyView(property: "Available MB", value: partition.availableMegabytes.description)
                                PropertyView(property: "Partition Type", value: partition.partitionType)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                PropertyView(property: "Usage", value: "\(partition.percentUsed.description) %")
                                PropertyView(property: "LVM Managed", value: partition.lvmManaged.description)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsPartitionsListView(Computer.mockData!.storage!.disks![1].partitions)
}
