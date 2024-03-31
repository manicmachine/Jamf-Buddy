//
//  DashboardWidgetView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 1/9/24.
//
import Charts
import SwiftUI

struct DashboardPieChartCellView: View {
    let metrics: [DashboardMetric]
    
    var body: some View {
        Chart(metrics.sorted(by: { $0.getValue() > $1.getValue() }), id: \.self) { metric in
            if metric.getValue() != 0 {
                SectorMark(
                    angle: .value(metric.tag, metric.getValue()),
                    innerRadius: .ratio(0.618),
                    angularInset: 1
                )
                .cornerRadius(5.0)
                .foregroundStyle(by: .value(metric.tag, metric.tag))
            }
        }
        .chartLegend(position: .trailing, alignment: .center)
        .padding()
    }
}

#Preview {
    DashboardPieChartCellView(metrics: Dashboard.mockData!.featureOptions["TYPE_POLICY"]![0].metrics)
}
