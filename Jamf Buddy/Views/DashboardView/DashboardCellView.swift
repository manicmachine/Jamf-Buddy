//
//  DashboardWidgetView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 1/5/24.
//

import Charts
import SwiftUI

struct DashboardCellView: View {
    let dashboardItem: DashboardItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(dashboardItem.title ?? "")")
                .font(.headline)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .scaledToFit()
                .padding(.top, 10)

            HStack(alignment: .center) {
                Spacer()
                switch dashboardItem.metrics.count {
                case let x where x > 1:
                    NavigationLink {
                        DashboardDetailView(dashboardItem: dashboardItem)
                    } label: {
                        DashboardPieChartCellView(metrics: dashboardItem.metrics)
                    }
                default:
                    DashboardMetricView(metric: dashboardItem.metrics[0].value)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    var dashboard = Dashboard.mockData!
    
    return List {
        ForEach(Array(dashboard.featureOptions.sorted(by: { $0.key < $1.key })), id: \.key) { section, widgets in
            Section("\(section)") {
                ForEach(widgets, id: \.self) { widget in
                    DashboardCellView(dashboardItem: widget)
                }
            }
        }
    }
}
