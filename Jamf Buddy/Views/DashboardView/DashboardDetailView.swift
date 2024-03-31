//
//  DashboardWidgetDetailView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 1/9/24.
//

import Charts
import SwiftUI

struct DashboardDetailView: View {
    @State private var viewModel: DashboardDetailViewModel
    
    init(dashboardItem: DashboardItem) {
        viewModel = DashboardDetailViewModel(dashboardItem)
    }
    
    var body: some View {
        VStack {
            Chart(viewModel.metrics, id: \.self) { metric in
                if metric.value != 0 {
                    SectorMark(
                        angle: .value(metric.label, metric.value),
                        innerRadius: .ratio(0.618),
                        outerRadius: .ratio(metric == viewModel.selectedMetric ? 1 : 0.90),
                        angularInset: 1
                    )
                    .cornerRadius(10)
                    .foregroundStyle(by: .value(metric.label, metric.label))
                }
            }
            .chartLegend(alignment: .bottomLeading)
            .chartBackground { chartProxy in
                GeometryReader { geometry in
                    if let _ = viewModel.selectedMetric {
                        let frame = geometry[chartProxy.plotFrame!]
                        
                        VStack {
                            Text(viewModel.selectedPercentageText)
                                .font(.title2.bold())
                                .foregroundStyle(.primary)
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            if !viewModel.dashboardItem.details.isEmpty {
                Picker(selection: $viewModel.showType) {
                    Text("General").tag(DashboardMetricType.general)
                    Text("Detailed").tag(DashboardMetricType.detailed)
                } label: {}
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    .onChange(of: viewModel.showType) { _, _ in
                        viewModel.selectedMetric = nil
                    }
            }

            
            List {
                ForEach(viewModel.metrics, id: \.self) { metric in
                    ZStack(alignment: .leading) {
                        PropertyView(property: metric.label, value: metric.value.formatted())
                            .bold(metric == viewModel.selectedMetric)
                            .opacity(viewModel.selectedMetric != nil ? (metric == viewModel.selectedMetric ? 1.0 : 0.5) : 1.0)
                        
                        // This is the tap area for the row
                        Rectangle()
                            .zIndex(1)
                            .foregroundColor(.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if viewModel.selectedMetric == metric {
                                    viewModel.selectedMetric = nil
                                } else {
                                    if metric.value > 0 {
                                        viewModel.selectedMetric = metric
                                    }
                                }
                            }
                    }
                }
            }
        }
        .navigationTitle(viewModel.dashboardItem.title ?? "")
    }
    
}

#Preview {
    DashboardDetailView(dashboardItem: Dashboard.mockData!.featureOptions["TYPE_POLICY"]![0])
}
