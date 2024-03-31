//
//  ComputerDetailsFontsListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import SwiftUI

struct ComputerDetailsFontsListView: View {
    let fonts: [ComputerFont]
    
    init(_ fonts: [ComputerFont]) {
        self.fonts = fonts.sorted { $0.name < $1.name }
    }

    var body: some View {
        List {
            Section {
                ForEach(fonts) { font in
                    VStack(alignment: .leading) {
                        PropertyView(property: "Name", value: font.name)
                        PropertyView(property: "Version", value: font.version ?? "")
                        PropertyView(property: "Path", value: font.path ?? "")
                    }
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsFontsListView(Computer.mockData!.fonts!)
}
