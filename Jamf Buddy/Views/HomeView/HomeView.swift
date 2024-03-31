//
//  HomeView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/1/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @Environment(JpsService.self) var jpsService: JpsService
    
    var body: some View {
        VStack {
            TabView {
                DashboardView(dashboard: jpsService.dashboard)
                    .tabItem {
                        Label("Dashboard", systemImage: "house.fill")
                    }
                ComputerListView(computers: jpsService.computers)
                    .tabItem {
                        Label("Computers", systemImage: "desktopcomputer")
                    }
                MobileDeviceListView()
                    .tabItem {
                        Label("Mobile Devices", systemImage: "ipad.and.iphone")
                    }
                UserListView()
                    .tabItem {
                        Label("Users", systemImage: "person.2.fill")
                    }
            }
        }
        .onAppear() {
            Task {
                do {
                    try await jpsService.retrieveAll()
                } catch {
                    print("Shit broke")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

