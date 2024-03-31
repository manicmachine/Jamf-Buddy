//
//  ComputerDetailsPackageReceiptsListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/27/23.
//

import SwiftUI

struct ComputerDetailsPackageReceiptsListView: View {
    let receipts: ComputerPackageReceipts
    var displayReceipts: [String]  {
        switch showType {
        case .JamfProServer:
            return receipts.installedByJamfPro ?? []
        case .InstallerSwu:
            return receipts.installedByInstallerSwu ?? []
        }
    }
    
    @State var showType: ComputerPackageReceipts.ReceiptSource = .JamfProServer
    
    init(_ receipts: ComputerPackageReceipts) {
        self.receipts = receipts
    }
    
    var body: some View {
        VStack {
            Picker("Installed By", selection: $showType) {
                Text("Jamf Pro Server").tag(ComputerPackageReceipts.ReceiptSource.JamfProServer)
                Text("Installer.app/SWU").tag(ComputerPackageReceipts.ReceiptSource.InstallerSwu)
            }
            .pickerStyle(.segmented)
            .padding([.bottom, .horizontal])
            
            List {
                ForEach(displayReceipts.sorted(), id: \.self) { receipt in
                    PropertyView(property: nil, value: receipt, allowScrolling: true)
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsPackageReceiptsListView(Computer.mockData!.packageReceipts!)
}
