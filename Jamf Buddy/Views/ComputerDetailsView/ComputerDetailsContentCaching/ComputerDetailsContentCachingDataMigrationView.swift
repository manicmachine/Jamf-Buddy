//
//  ComputerDetailsContentCachingDataMigrationView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import SwiftUI

struct ComputerDetailsContentCachingDataMigrationView: View {
    let migrationError: ComputerContentCachingDataMigrationError
    
    init(_ migrationError: ComputerContentCachingDataMigrationError) {
        self.migrationError = migrationError
    }
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    PropertyView(property: "Code", value: migrationError.code.formatted())
                    PropertyView(property: "Domain", value: migrationError.domain ?? "")
                    
                    if let userInfo = migrationError.userInfo {
                        ForEach(userInfo) { info in
                            PropertyView(property: info.key, value: info.value ?? "")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsContentCachingDataMigrationView(Computer.mockData!.contentCaching!.dataMigrationError!)
}
