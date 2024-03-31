//
//  ComputerExtensionAttribute.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerExtensionAttribute: Codable, Hashable, Searchable {
    var definitionId: String
    var name: String
    var description: String?
    var enabled: Bool
    var multiValue: Bool
    var values: [String]
    var dataType: String
    var options: [String]
    var inputType: String
    
    func contains(searchText: String) -> Bool {
        print("Searching extension attributes")
        for value in values {
            if value.lowercased().contains(searchText) {
                return true
            }
        }
        
        return false
    }
}
