//
//  DashboardDetailViewModel.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 1/24/24.
//

import Foundation

@Observable
class DashboardDetailViewModel {
    let dashboardItem: DashboardItem

    var selectedMetric: DashboardMetricWrapper?
    var showType: DashboardMetricType = .general
    var metrics: [DashboardMetricWrapper] {
        switch showType {
        case .general:
            return dashboardItem.metrics.sorted(by: { $0.getValue() > $1.getValue() })
                .map { DashboardMetricWrapper($0) }
        case .detailed:
            return dashboardItem.details.sorted(by: { $0.getValue() > $1.getValue() })
                .map { DashboardMetricWrapper($0) }
        }
    }
    
    var selectedPercentageText: String {
        guard let selectedMetric = selectedMetric else { return "" }
        
        let total = metrics.reduce(0) { accumulator, currentElement in
            accumulator + currentElement.value
        }
        
        let percentage = Float(selectedMetric.value) / Float(total)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.numberStyle = .percent
        
        return formatter.string(for: percentage)!
    }
    
    init(_ dashboardItem: DashboardItem) {
        self.dashboardItem = dashboardItem
    }
}

