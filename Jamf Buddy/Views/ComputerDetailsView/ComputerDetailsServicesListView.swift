//
//  ComputerDetailsServicesListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/27/23.
//

import SwiftUI

struct ComputerDetailsServicesListView: View {
    let services: [ComputerService]
    
    init(_ services: [ComputerService]) {
        self.services = services.sorted { $0.name < $1.name }
    }

    var body: some View {
        List {
            ForEach(services, id: \.name) { service in
                PropertyView(property: nil, value: service.name, allowScrolling: true)
            }
        }
    }
}

#Preview {
    ComputerDetailsServicesListView(Computer.mockData!.services!)
}
