//
//  ComputerContentCaching.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerContentCaching: Codable, Hashable {
    let computerContentCachingInformationId: String?
    let parents: [ComputerContentCachingParent]?
    let alerts: [ComputerContentCachingAlert]?
    let activated: Bool?
    let active: Bool?
    let actualCacheBytesUsed: Int64?
    let cacheDetails: [ComputerContentCachingCacheDetail]?
    let cacheBytesFree: Int64?
    let cacheBytesLimit: Int64?
    let cacheStatus: String?
    let cacheBytesUsed: Int64?
    let dataMigrationCompleted: Bool?
    let dataMigrationProgressPercentage: Int?
    let dataMigrationError: ComputerContentCachingDataMigrationError?
    let maxCachePressureLast1HourPercentage: Int?
    let personalCacheBytesFree: Int64?
    let personalCacheBytesLimit: Int64?
    let personalCacheBytesUsed: Int64?
    let port: Int64?
    let publicAddress: String?
    let registrationError: String?
    let registrationResponseCode: Int64?
    let registrationStarted: Date?
    let registrationStatus: String?
    let restrictedMedia: Bool?
    let serverGuid: String?
    let startupStatus: String?
    let tetheratorStatus: String?
    let totalBytesAreSince: Date?
    let totalBytesDropped: Int64?
    let totalBytesImported: Int64?
    let totalBytesReturnedToChildren: Int64?
    let totalBytesReturnedToClients: Int64?
    let totalBytesReturnedToPeers: Int64?
    let totalBytesStoredFromOrigin: Int64?
    let totalBytesStoredFromParents: Int64?
    let totalBytesStoredFromPeers: Int64?
}
