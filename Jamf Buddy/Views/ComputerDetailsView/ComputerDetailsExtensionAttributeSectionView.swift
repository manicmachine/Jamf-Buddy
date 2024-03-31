//
//  ComputerDetailsExtensionAttributeSectionView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/26/23.
//

import SwiftUI

struct ComputerDetailsExtensionAttributeSectionView: View {
    let extensionAttributes: [ComputerExtensionAttribute]
    
    init(_ extensionAttributes: [ComputerExtensionAttribute]) {
        self.extensionAttributes = extensionAttributes
    }

    var body: some View {
        Section(header:
            Text("Extension Attributes")
            .font(.largeTitle)
            .scaledToFit()
            .minimumScaleFactor(0.5)
        ) {
            ComputerDetailsExtensionAttributeListView(extensionAttributes, includeHeader: false)
        }
    }
}

#Preview {
    ComputerDetailsExtensionAttributeSectionView(Computer.mockData!.extensionAttributes!)
}
