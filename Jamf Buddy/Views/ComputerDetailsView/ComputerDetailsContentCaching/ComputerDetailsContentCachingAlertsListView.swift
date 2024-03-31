//
//  ComputerDetailsContentCachingAlertsListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import SwiftUI

struct ComputerDetailsContentCachingAlertsListView: View {
    let alerts: [ComputerContentCachingAlert]
    
    init(_ alerts: [ComputerContentCachingAlert]) {
        self.alerts = alerts.sorted { $0.postDate > $1.postDate }
    }

    var body: some View {
        List {
            ForEach(alerts) { alert in
                Section {
                    PropertyView(property: "Post Date", value: alert.postDate.getRelativeAndCompleteString())
                    PropertyView(property: "Resource", value: alert.resource ?? "")
                    PropertyView(property: "Class Name", value: alert.className ?? "")
                    PropertyView(property: "Path Preventing Access", value: alert.pathPreventingAccess ?? "")
                    PropertyView(property: "Cache MB Limit", value: alert.cacheBytesLimit?.convertBytesToMB().formatted(.number) ?? "")
                    PropertyView(property: "Reserved Volume MB", value: alert.reservedVolumeBytes?.convertBytesToMB().formatted(.number) ?? "")
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsContentCachingAlertsListView(Computer.mockData!.contentCaching!.alerts!)
}
