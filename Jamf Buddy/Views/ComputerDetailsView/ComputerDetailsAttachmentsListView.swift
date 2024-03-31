//
//  ComputerDetailsAttachmentsListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/27/23.
//

import SwiftUI

struct ComputerDetailsAttachmentsListView: View {
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    private var isCompact: Bool { horizontalSizeClass == .compact }
#else
    private let isCompact = false
#endif
    
    @State private var sortOrder = [KeyPathComparator(\ComputerAttachment.name)]
    let attachments: [ComputerAttachment]
    
    init(_ attachments: [ComputerAttachment]) {
        self.attachments = attachments.sorted { $0.name < $1.name }
    }

    var body: some View {
        Table(attachments, sortOrder: $sortOrder) {
            TableColumn("Name", value: \.name) { attachment in
                VStack(alignment: .leading) {
                    PropertyView(property: "Name", value: attachment.name)
                        .scaledToFill()
                        .padding(.bottom)
                    
                    if isCompact {
                        HStack(alignment: .top) {
                            PropertyView(property: "ID", value: attachment.id)
                            PropertyView(property: "File Type", value: attachment.fileType ?? "")
                            PropertyView(property: "Size Bytes")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let mockData = [
        ComputerAttachment(id: "1", name: "Some zip", fileType: "ZIP", sizeBytes: 1024),
        ComputerAttachment(id: "2", name: "Some JPG", fileType: "JPG", sizeBytes: 512),
        ComputerAttachment(id: "3", name: "Some PNG", fileType: "PNG", sizeBytes: 8192),
    ]

    return ComputerDetailsAttachmentsListView(mockData)
}
