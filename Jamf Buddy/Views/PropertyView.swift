//
//  PropertyView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/20/23.
//

import SwiftUI
import TipKit

struct PropertyView: View {
    var property: String? = "Test Property"
    var value: String = "Test Value"
    var allowScrolling: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, content: {

            
            if allowScrolling {
                if let property = property {
                    Text(property)
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                        .textSelection(.disabled)
                }
                ScrollView([.horizontal]) {
                    Text(value)
                        .foregroundStyle(.primary)
                        .font(.headline)
                        .textSelection(.enabled)
                        .padding(EdgeInsets(.init(top: 0, leading: 0, bottom: 7.5, trailing: 0)))
                }
                .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
            } else {
                if let property = property {
                    Text(property)
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                        .textSelection(.disabled)
                        .scaledToFit()
                        .minimumScaleFactor(0.5)
                }
                Text(value)
                    .foregroundStyle(.primary)
                    .font(.headline)
                    .textSelection(.enabled)
                    .scaledToFit()
                    .minimumScaleFactor(0.5)
            }
        })
    }
}

#Preview {
    List {
        PropertyView(property: "Test Property", value: "Test Value")
        PropertyView(property: nil, value: "Test Value, No Header")
        PropertyView(property: "Test Property", value: "Test Value very long text that'll need to scroll", allowScrolling: true)
        PropertyView(property: nil, value: "Test Value very long text that'll need to scroll", allowScrolling: true)
    }
}
