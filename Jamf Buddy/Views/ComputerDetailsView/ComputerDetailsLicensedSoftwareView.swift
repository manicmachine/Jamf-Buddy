//
//  ComputerDetailsLicensedSoftwareView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/26/23.
//

import SwiftUI

struct ComputerDetailsLicensedSoftwareView: View {
    let licensedSoftware: [ComputerLicensedSoftware]

    init(_ licensedSoftware: [ComputerLicensedSoftware]) {
        self.licensedSoftware = licensedSoftware
    }

    var body: some View {
        Section(header:
            Text("Licensed Software")
            .font(.largeTitle)
            .scaledToFit()
            .minimumScaleFactor(0.5)
        ) {
            ForEach(licensedSoftware, id: \.id){ software in
                PropertyView(property: "Name", value: software.name)
            }
        }
    }
}

#Preview {
    List {
        ComputerDetailsLicensedSoftwareView(Computer.mockData!.licensedSoftware!)        
    }
}
