//
//  ComputerPackageReceipts.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerPackageReceipts: Codable, Hashable {
    let installedByJamfPro: [String]?
    let installedByInstallerSwu: [String]?
    let cached: [String]?

    var count: Int {
        var _count = 0
        
        if let installedByJamfPro = installedByJamfPro {
            _count += installedByJamfPro.count
        }
        
        if let installedByInstallerSwu = installedByInstallerSwu {
            _count += installedByInstallerSwu.count
        }
        
        return _count
    }
    
    enum CodingKeys: String, CodingKey {
        case installedByJamfPro
        case installedByInstallerSwu
        case cached
    }
}

extension ComputerPackageReceipts {
    enum ReceiptSource {
        case JamfProServer
        case InstallerSwu
    }
}
