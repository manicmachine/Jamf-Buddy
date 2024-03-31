//
//  ComputerDetailsPluginsListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import SwiftUI

struct ComputerDetailsPluginsListView: View {
    let plugins: [ComputerPlugin]
    
    init(_ plugins: [ComputerPlugin]) {
        self.plugins = plugins.sorted { $0.name < $1.name }
    }

    var body: some View {
        List {
            Section {
                ForEach(plugins) { plugin in
                    VStack(alignment: .leading) {
                        PropertyView(property: "Name", value: plugin.name)
                        PropertyView(property: "Version", value: plugin.version ?? "")
                        PropertyView(property: "Path", value: plugin.path ?? "")
                    }
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsPluginsListView(Computer.mockData!.plugins!)
}
