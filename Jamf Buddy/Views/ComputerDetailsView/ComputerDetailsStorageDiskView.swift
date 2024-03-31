//
//  ComputerDetailsStorageDiskView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/21/23.
//

import SwiftUI

struct ComputerDetailsStorageDiskView: View {
    let disk: ComputerDisk

    init(_ disk: ComputerDisk) {
        self.disk = disk
    }

    var body: some View {
        PropertyView(property: "Model", value: disk.model ?? "")
        PropertyView(property: "Device", value: disk.device ?? "")
        PropertyView(property: "Revision", value: disk.revision ?? "")
        PropertyView(property: "Serial Number", value: disk.serialNumber ?? "")
        PropertyView(property: "Drive Capacity GB", value: ((disk.sizeMegabytes ?? 0) / 1000).description)
        PropertyView(property: "S.M.A.R.T Status", value: disk.smartStatus ?? "")
        PropertyView(property: "Number of Partitions", value: disk.partitions.count.description)
        
        if !disk.partitions.isEmpty {
            NavigationLink {
                ComputerDetailsPartitionsListView(disk.partitions.sorted{ $0.name < $1.name })
            } label: {
                Text("Partition Details")
            }
        }
    }
}

#Preview {
    return List {
        ComputerDetailsStorageDiskView(Computer.mockData!.storage!.disks![1])
    }
}
