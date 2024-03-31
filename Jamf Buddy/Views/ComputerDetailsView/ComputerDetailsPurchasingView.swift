//
//  ComputerDetailsPurchasingView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/21/23.
//

import SwiftUI

struct ComputerDetailsPurchasingView: View {
    let purchasing: ComputerPurchase

    init(_ purchasing: ComputerPurchase) {
        self.purchasing = purchasing
    }

    var body: some View {
        Section(header:
            Text("Purchasing")
            .font(.largeTitle)
            .scaledToFit()
            .minimumScaleFactor(0.5)
        ) {
            PropertyView(property: "Purchased or Leased", value: purchasedOrLeased())
            PropertyView(property: "PO Number", value: purchasing.poNumber ?? "")
            PropertyView(property: "PO Date", value: purchasing.poDate?.getRelativeAndCompleteString() ?? "")
            PropertyView(property: "Vendor", value: purchasing.vendor ?? "")
            PropertyView(property: "Warranty Expiration", value: purchasing.warrantyDate?.getRelativeAndCompleteString() ?? "")
            PropertyView(property: "AppleCare ID", value: purchasing.appleCareId ?? "")
            PropertyView(property: "Purchase Price", value: purchasing.purchasePrice ?? "")
            PropertyView(property: "Life Expectancy", value: purchasing.lifeExpectancy?.description ?? "")
            PropertyView(property: "Purchasing Account", value: purchasing.purchasingAccount ?? "")
            PropertyView(property: "Purchasing Contact", value: purchasing.purchasingContact ?? "")
            PropertyView(property: "Lease Date", value: purchasing.leaseDate?.getRelativeAndCompleteString() ?? "")
            
            if let extensionAttributes = purchasing.extensionAttributes {
                if !extensionAttributes.isEmpty {
                    ComputerDetailsExtensionAttributeListView(extensionAttributes)
                }
            }
        }
    }
    func purchasedOrLeased() -> String {
        if let purchased = purchasing.purchased {
            if purchased {
                return "Purchased"
            }
        }
        
        if let leased = purchasing.leased {
            if leased {
                return "Leased"
            }
        }
        
        return ""
    }
}

#Preview {
    return List {
        ComputerDetailsPurchasingView(Computer.mockData!.purchasing!)
    }
}
