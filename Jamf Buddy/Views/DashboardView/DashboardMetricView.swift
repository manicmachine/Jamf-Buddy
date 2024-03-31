//
//  DashboardMetricView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 1/9/24.
//

import SwiftUI

struct DashboardMetricView: View {
    let metric: String
    var body: some View {
        VStack(alignment: .center) {
            Text(metric)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color(.label))
            Text("Devices")
                .font(.subheadline)
                .foregroundStyle(Color(.secondaryLabel))
        }
        .padding()
    }
}

#Preview {
    DashboardMetricView(metric: "123")
}
