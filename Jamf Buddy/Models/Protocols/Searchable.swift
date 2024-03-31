//
//  Searchable.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/19/23.
//

import Foundation

protocol Searchable {
    func contains(searchText: String) -> Bool
}

extension Searchable {
    func contains(searchText: String) -> Bool {
        debugPrint("Searching \(self)")
        let mirror = Mirror(reflecting: self)
        
        for (property, value) in mirror.children {
            guard let _ = property else {
                continue
            }
            
            if let stringValue = (value as? String) {
                if stringValue.lowercased().contains(searchText) {
                    return true
                }
            } else if let stringArray = (value as? [String]) {
                if stringArray.contains(searchText) {
                    return true
                }
            } else if let searchableObj = (value as? Searchable) {
                if searchableObj.contains(searchText: searchText) {
                    return true
                }
            }
        }
        
        return false
    }
}
