//
//  ComputerDetailsPrintersListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/27/23.
//

import SwiftUI

struct ComputerDetailsPrintersListView: View {
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    private var isCompact: Bool { horizontalSizeClass == .compact }
#else
    private let isCompact = false
#endif
    
    @State private var sortOrder = [KeyPathComparator(\ComputerPrinter.name)]
    let printers: [ComputerPrinter]
    
    init(_ printers: [ComputerPrinter]) {
        self.printers = printers
    }

    var body: some View {
        Table(printers, sortOrder: $sortOrder) {
            TableColumn("Name", value: \.name) { printer in
                VStack(alignment: .leading) {
                    PropertyView(property: "Name", value: printer.name)
                    
                    if isCompact {
                        PropertyView(property: "Type", value: printer.type ?? "")
                        PropertyView(property: "URI", value: printer.uri ?? "", allowScrolling: true)
                        PropertyView(property: "Location", value: printer.location ?? "")
                    }
                }
            }
        }
    }
}

#Preview {
    let mockData = [
        ComputerPrinter(name: "Test Printer", type: "Network", uri: "Some URI", location: "Down the hall, to the left"),
        ComputerPrinter(name: "Another Test Printer", type: "Local", uri: "Some other URI", location: "Down the hall, to the right")
    ]

    return ComputerDetailsPrintersListView(mockData)
}
