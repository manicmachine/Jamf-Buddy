//
//  ComputerDetailsContentCachingDetailsView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import SwiftUI

struct ComputerDetailsContentCachingDetailsView: View {
    let details: [ComputerContentCachingCacheDetail]
    
    init(_ details: [ComputerContentCachingCacheDetail]) {
        self.details = details
    }

    var body: some View {
        List {
            ForEach(details, id: \.computerContentCachingCacheDetailsId) { detail in
                Section(header: Text("Detail \(detail.computerContentCachingCacheDetailsId)")) {
                    PropertyView(property: "Category Name", value: detail.categoryName ?? "")
                    PropertyView(property: "Disk Space Used MB", value: detail.diskSpaceBytesUsed?.convertBytesToMB().formatted(.number) ?? "")
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsContentCachingDetailsView(Computer.mockData!.contentCaching!.cacheDetails!)
}
