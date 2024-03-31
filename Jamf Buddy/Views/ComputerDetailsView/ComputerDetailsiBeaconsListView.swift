//
//  ComputerDetailsiBeaconsListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import SwiftUI

struct ComputerDetailsiBeaconsListView: View {
    let ibeacons: [ComputerIbeacon]
    
    init(_ ibeacons: [ComputerIbeacon]) {
        self.ibeacons = ibeacons.sorted { $0.name < $1.name }
    }
    
    var body: some View {
        List {
            Section {
                ForEach(ibeacons, id: \.name) { ibeacon in
                    PropertyView(property: "Name", value: ibeacon.name)
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsiBeaconsListView(Computer.mockData!.ibeacons!)
}
