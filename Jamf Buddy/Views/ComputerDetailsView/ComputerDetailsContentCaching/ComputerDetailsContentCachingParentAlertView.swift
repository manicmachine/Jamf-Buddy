//
//  ComputerDetailsContentCachingParentAlertView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import SwiftUI

struct ComputerDetailsContentCachingParentAlertView: View {
    let alert: ComputerContentCachingParentAlert
    
    init(_ alert: ComputerContentCachingParentAlert) {
        self.alert = alert
    }

    var body: some View {
        List {
            Section(header: Text("Parent Alert \(alert.contentCachingParentAlertId)")) {
                PropertyView(property: "Class Name", value: alert.className ?? "")
                PropertyView(property: "Addresses", value: alert.addresses?.joined(separator: ", ") ?? "")
                PropertyView(property: "Post Date", value: alert.postDate?.getRelativeAndCompleteString() ?? "")
            }
        }
    }
}

#Preview {
    ComputerDetailsContentCachingParentAlertView(Computer.mockData!.contentCaching!.parents![0].alerts!)
}
