//
//  ExtensionAttributesListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/21/23.
//

import SwiftUI

struct ComputerDetailsExtensionAttributeListView: View {
    let includeHeader: Bool
    let extensionAttributes: [ComputerExtensionAttribute]

    init(_ extensionAttributes: [ComputerExtensionAttribute], includeHeader: Bool = true) {
        self.includeHeader = includeHeader
        self.extensionAttributes = extensionAttributes
    }
    
    var body: some View {
        if includeHeader {
            HStack {
                VStack { Divider() }
                Text("Extension Attributes")
                    .font(.subheadline)
                    .lineLimit(1)
                    .fixedSize()
                VStack { Divider() }
            }
            .listRowSeparator(.hidden)
        }

        ForEach(extensionAttributes.sorted { $0.name < $1.name }, id:\.self) { attribute in
            PropertyView(property: attribute.name, value: attribute.values.joined(separator: ", "))
        }
    }
}

#Preview {
    return List {
        ComputerDetailsExtensionAttributeListView(Computer.mockData!.general!.extensionAttributes!)
    }
}
