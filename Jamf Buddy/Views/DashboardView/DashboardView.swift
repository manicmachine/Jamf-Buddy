//
//  DashboardView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/1/23.
//

import Charts
import SwiftUI

struct DashboardView: View {
    @Environment(JpsService.self) var jpsService: JpsService
    
    var dashboard: Dashboard?
    
    var body: some View {
        NavigationStack {
            if let dashboard = dashboard {
                List {
                    ForEach(Array(dashboard.featureOptions.sorted(by: { $0.key < $1.key })), id: \.key) { section, widgets in
                        
                        Section("\(getSectionText(of: section))") {
                            ForEach(widgets, id: \.self) { widget in
                                DashboardCellView(dashboardItem: widget)
                            }
                        }
                    }
                }
            } else {
                Text("No dashboard configured!")
            }
        }
        .refreshable {
            Task {
                try await jpsService.getDashboard()
            }
        }
        .navigationTitle("")
    }
    
    func getSectionText(of section: String) -> String {
        return section
            .replacingOccurrences(of: "_", with: " ")
            .replacingOccurrences(of: "TYPE ", with: "")
            .replacing(try! Regex("Y$"), with: "ie")
            .appending("s")
    }
}

#Preview {
    DashboardView(dashboard: Dashboard.mockData!)
        .environment(JpsService())
}
