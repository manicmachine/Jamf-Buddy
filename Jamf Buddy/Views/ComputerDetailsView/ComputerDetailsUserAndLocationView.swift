//
//  ComputerDetailsUserAndLocationView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/21/23.
//

import SwiftUI

struct ComputerDetailsUserAndLocationView: View {
    let userAndLocation: ComputerUserAndLocation

    init(_ userAndLocation: ComputerUserAndLocation) {
        self.userAndLocation = userAndLocation
    }

    var body: some View {
        Section(header:
                    Text("User and Location")
            .font(.largeTitle)
            .scaledToFit()
            .minimumScaleFactor(0.5)
        ) {
            PropertyView(property: "Username", value: userAndLocation.username ?? "")
            PropertyView(property: "Full Name", value: userAndLocation.realname ?? "")
            PropertyView(property: "Email Address", value: userAndLocation.email ?? "")
            PropertyView(property: "Phone Number", value: userAndLocation.phone ?? "")
            PropertyView(property: "Position", value: userAndLocation.position ?? "")
            PropertyView(property: "Department ID", value: userAndLocation.departmentId ?? "")
            PropertyView(property: "Building ID", value: userAndLocation.buildingId ?? "")
            PropertyView(property: "Room", value: userAndLocation.room ?? "")
            
            if let extensionAttributes = userAndLocation.extensionAttributes {
                if !extensionAttributes.isEmpty {
                    ComputerDetailsExtensionAttributeListView(extensionAttributes)
                }
            }
        }
    }
}

#Preview {
    return List {
        ComputerDetailsUserAndLocationView(Computer.mockData!.userAndLocation!)
    }
}
