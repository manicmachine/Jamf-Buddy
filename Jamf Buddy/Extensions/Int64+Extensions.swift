//
//  Int64+Extensions.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/28/23.
//

import Foundation

extension Int64 {
    func convertBytesToKB() -> Int64 {
        return (self / 1024)
    }
    
    func convertBytesToMB() -> Int64 {
        return (self / 1024 / 1024)
    }
    
    func convertBytesToGB() -> Int64 {
        return (self / 1024 / 1024 / 1024)
    }
}
