//
//  Jamf_BuddyApp.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 11/10/23.
//

import SwiftData
import SwiftUI

@main
struct Jamf_BuddyApp: App {
//    @StateObject private var jpsService = JpsService(modelContext: ModelService.shared.modelContainer.mainContext)
    @State private var jpsService = JpsService()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if jpsService.isAuthenticated {
                    HomeView()
                } else {
                    LoginView()
                }
            }
            .alert("Error encountered", isPresented: $jpsService.hasError
            ) {
                Button("OK") {
                    jpsService.error = nil
                }
            } message: {
                if let jpsError = (jpsService.error as? JpsError) {
                    Text(jpsError.rawValue)
                } else {
                    Text(jpsService.error?.localizedDescription ?? "An unknown error has occurred")
                }
            }
        }
        .environment(jpsService)
//        .modelContainer(ModelService.shared.modelContainer)
    }
}
