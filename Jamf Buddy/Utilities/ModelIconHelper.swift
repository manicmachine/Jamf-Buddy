//
//  ModelIcons.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/4/23.
//

import Foundation

struct ModelIconHelper {
    
    enum ModelIcon: String, CaseIterable {
        // Computers
        case macbook = "macbook"
        case imac = "desktopcomputer"
        case mini = "macmini"
        case macpro = "macpro.gen3"
        
        // Mobile Devices
        case iphone = "iphone"
        case ipad = "ipad"
        case tv = "appletv"
        case watch = "applewatch"
        case vision = "visionpro"
        
        // Default
        case generic = "apple.logo"
    }
    
    static func getIcon(for modelText: String?) -> String {
        guard let modelText = modelText else { return ModelIcon.generic.rawValue }

        return switch modelText.lowercased() {
        case let text where text.contains("macbook"):
            ModelIcon.macbook.rawValue
        case let text where text.contains("imac"):
            ModelIcon.imac.rawValue
        case let text where text.contains("mini"):
            ModelIcon.mini.rawValue
        case let text where text.contains("macpro"):
            ModelIcon.macpro.rawValue
        case let text where text.contains("mac"):
            ModelIcon.macbook.rawValue
        case let text where text.contains("iphone"):
            ModelIcon.iphone.rawValue
        case let text where text.contains("ipad"):
            ModelIcon.ipad.rawValue
        case let text where text.contains("tv"):
            ModelIcon.tv.rawValue
        case let text where text.contains("watch"):
            ModelIcon.watch.rawValue
        case let text where text.contains("vision"):
            ModelIcon.vision.rawValue
        default:
            ModelIcon.generic.rawValue
        }
    }
}
