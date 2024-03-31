//
//  ComputerDetailsHardwareView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/21/23.
//

import SwiftUI

struct ComputerDetailsHardwareView: View {
    let hardware: ComputerHardware
    
    init(_ hardware: ComputerHardware) {
        self.hardware = hardware
    }
    
    var body: some View {
        Section(header: Text("Hardware").font(.largeTitle)) {
            PropertyView(property: "Make", value: hardware.make ?? "")
            PropertyView(property: "Model", value: hardware.model ?? "")
            PropertyView(property: "Model Identifier", value: hardware.modelIdentifier ?? "")
            PropertyView(property: "Serial Number", value: hardware.serialNumber ?? "")
            PropertyView(property: "Processor Type", value: hardware.processorType ?? "")
            PropertyView(property: "Apple Silicon", value: hardware.appleSilicon?.description ?? "")
            PropertyView(property: "Processor Architecture", value: hardware.processorArchitecture ?? "")
            PropertyView(property: "Processor Speed Mhz", value: hardware.processorSpeedMhz?.description ?? "")
            PropertyView(property: "Processor Count", value: hardware.processorCount?.description ?? "")
            PropertyView(property: "Processor Core Count", value: hardware.coreCount?.description ?? "")
            PropertyView(property: "Bus Speed Mhz", value: hardware.busSpeedMhz?.description ?? "")
            PropertyView(property: "Cache Size Kilobytes", value: hardware.processorSpeedMhz?.description ?? "")
            PropertyView(property: "Total RAM MB", value: hardware.totalRamMegabytes?.description ?? "")
            PropertyView(property: "Open RAM Slots", value: hardware.openRamSlots?.description ?? "")
            PropertyView(property: "Primary Network Adapter Type", value: hardware.networkAdapterType ?? "")
            PropertyView(property: "Primary MAC Address", value: hardware.macAddress ?? "")
            PropertyView(property: "Secondary Network Adapter Type", value: hardware.altNetworkAdapterType ?? "")
            PropertyView(property: "Secondary MAC Address", value: hardware.altMacAddress ?? "")
            PropertyView(property: "Battery Capacity Percent", value: hardware.batteryCapacityPercent?.description ?? "")
            PropertyView(property: "SMC Version", value: hardware.smcVersion ?? "")
            PropertyView(property: "NIC Speed", value: hardware.nicSpeed ?? "")
            PropertyView(property: "Boot ROM", value: hardware.bootRom ?? "")
            
            if let extensionAttributes = hardware.extensionAttributes {
                if !extensionAttributes.isEmpty {
                    ComputerDetailsExtensionAttributeListView(extensionAttributes)
                }
            }
        }
    }
}

#Preview {
    return List {
        ComputerDetailsHardwareView(Computer.mockData!.hardware!)
    }
}
