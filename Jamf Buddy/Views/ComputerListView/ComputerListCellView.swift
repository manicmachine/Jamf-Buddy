//
//  ComputerView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/2/23.
//

import SwiftData
import SwiftUI

struct ComputerListCellView: View {
    var computer: Computer
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .center) {
                Image(systemName: computer.getModelIconName())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(computer.hardware?.modelIdentifier ?? "")
                    .font(.caption2)
                    .scaledToFit()
                    .minimumScaleFactor(0.5)
            }.frame(width: 90, height: 75)
            
            Spacer()

            VStack(alignment: .leading) {
                PropertyView(property: "Name", value: computer.general?.name ?? "")
                PropertyView(property: "Serial Number", value: computer.hardware?.serialNumber ?? "")
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                PropertyView(property: "ID", value: computer.id)
                PropertyView(property: "Asset Tag", value: computer.general?.assetTag ?? "")
            }
        }
    }
}

#Preview {
    List {
        ComputerListCellView(computer: ComputersListResults.mockData!.computers[0])
    }
}
