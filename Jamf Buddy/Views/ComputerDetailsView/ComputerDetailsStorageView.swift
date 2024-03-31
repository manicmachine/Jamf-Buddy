//
//  ComputerDetailsStorageView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/21/23.
//

import SwiftUI

struct ComputerDetailsStorageView: View {
    let storage: ComputerStorage

    init(_ storage: ComputerStorage) {
        self.storage = storage
    }

    var body: some View {
        Section(header:
            Text("Storage")
            .font(.largeTitle)
            .scaledToFit()
            .minimumScaleFactor(0.5)
        ) {
            PropertyView(property: "Boot Drive Available Space Mb", value: storage.bootDriveAvailableSpaceMegabytes?.description ?? "")
            
            if let disks = storage.disks {
                ForEach(disks, id: \.id) { disk in
                    ComputerDetailsStorageDiskView(disk)
                }
            }
        }
    }
}

#Preview {
    return List {
        ComputerDetailsStorageView(Computer.mockData!.storage!)
    }
}
