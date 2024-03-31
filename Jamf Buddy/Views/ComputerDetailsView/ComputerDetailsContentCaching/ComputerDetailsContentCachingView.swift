//
//  ComputerDetailsContentCachingView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/27/23.
//

import SwiftUI

struct ComputerDetailsContentCachingView: View {
    let contentCaching: ComputerContentCaching

    init(_ contentCaching: ComputerContentCaching) {
        self.contentCaching = contentCaching
    }

    var body: some View {
        List {
            Section(header:
                        Text("Content Caching")
                .font(.largeTitle)
                .scaledToFit()
                .minimumScaleFactor(0.5)
            ) {
                PropertyView(property: "Information ID", value: contentCaching.computerContentCachingInformationId ?? "")
                
                if let parents = contentCaching.parents {
                    if !parents.isEmpty {
                        NavigationLink {
                            ComputerDetailsContentCachingParentView(parents)
                        } label: {
                            PropertyView(property: nil, value: "\(parents.count) Parent\(if: parents.count > 1, "s")")
                        }
                        .navigationTitle("Content Caching Parents")
                    }
                } else {
                    PropertyView(property: nil, value: "No Parents")
                }
                
                
                if let alerts = contentCaching.alerts {
                    if !alerts.isEmpty {
                        NavigationLink {
                            ComputerDetailsContentCachingAlertsListView(alerts)
                        } label: {
                            PropertyView(property: nil, value: "\(alerts.count) Alert\(if: alerts.count > 1, "s")")
                        }
                        .navigationTitle("Content Caching Alerts")
                    }
                } else {
                    PropertyView(property: nil, value: "No Alerts")
                }
                
                if let cacheDetails = contentCaching.cacheDetails {
                    if !cacheDetails.isEmpty {
                        NavigationLink {
                            ComputerDetailsContentCachingDetailsView(cacheDetails)
                        } label: {
                            PropertyView(property: nil, value: "Cache Details")
                        }
                        .navigationTitle("Content Caching Details")
                    }
                } else {
                    PropertyView(property: nil, value: "No Cache Details")
                }
                
                if let dataMigrationError = contentCaching.dataMigrationError {
                    if dataMigrationError.code != 0 {
                        NavigationLink {
                            ComputerDetailsContentCachingDataMigrationView(dataMigrationError)
                        } label: {
                            PropertyView(property: "Data Migration Error", value: "Details")
                        }
                        .navigationTitle("Data Migration Error \(dataMigrationError.code)")
                    }
                } else {
                    PropertyView(property: nil, value: "No Data Migration Errors")
                }
                
                PropertyView(property: "Port", value: contentCaching.port?.formatted() ?? "")
                PropertyView(property: "Public Adress", value: contentCaching.publicAddress ?? "")
                PropertyView(property: "Activated", value: contentCaching.activated?.description ?? "")
                PropertyView(property: "Active", value: contentCaching.active?.description ?? "")
                PropertyView(property: "Actual Cache Bytes Used", value: contentCaching.actualCacheBytesUsed?.formatted(.number) ?? "")
                
                
                PropertyView(property: "Cache Status", value: contentCaching.cacheStatus ?? "")
                PropertyView(property: "Cache MB Free", value: contentCaching.cacheBytesFree?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Cache MB Used", value: contentCaching.cacheBytesUsed?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Cache MB Limit", value: contentCaching.cacheBytesLimit?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Data Migration Completed", value: contentCaching.dataMigrationCompleted?.description ?? "")
                PropertyView(property: "Data Migration Progress Percentage", value: contentCaching.dataMigrationProgressPercentage?.formatted(.percent) ?? "")
                
                PropertyView(property: "Max Cache Pressure Last 1 Hour", value: contentCaching.maxCachePressureLast1HourPercentage?.formatted(.percent) ?? "")
                PropertyView(property: "Personal Cache MB Free", value: contentCaching.personalCacheBytesFree?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Personal Cache MB Used", value: contentCaching.personalCacheBytesUsed?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Personal Cache MB Limit", value: contentCaching.personalCacheBytesLimit?.convertBytesToMB().formatted(.number) ?? "")
                
                if let error = contentCaching.registrationError {
                    PropertyView(property: "Registration Error", value: error)
                }
                
                PropertyView(property: "Registration Response Code", value: contentCaching.registrationResponseCode?.formatted() ?? "")
                PropertyView(property: "Registration Started", value: contentCaching.registrationStarted?.getRelativeAndCompleteString() ?? "")
                PropertyView(property: "Registration Status", value: contentCaching.registrationStatus ?? "")
                PropertyView(property: "Restricted Media", value: contentCaching.restrictedMedia?.description ?? "")
                PropertyView(property: "Server GUID", value: contentCaching.serverGuid ?? "")
                PropertyView(property: "Startup Status", value: contentCaching.startupStatus ?? "")
                PropertyView(property: "Tetherator Status", value: contentCaching.tetheratorStatus ?? "")
                PropertyView(property: "Total MB Dropped", value: contentCaching.totalBytesDropped?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Total MB Imported", value: contentCaching.totalBytesImported?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Total MB Returned To Children", value: contentCaching.totalBytesReturnedToChildren?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Total MB Returned To Clients", value: contentCaching.totalBytesReturnedToClients?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Total MB Returned To Peers", value: contentCaching.totalBytesReturnedToPeers?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Total MB Stored From Origin", value: contentCaching.totalBytesStoredFromOrigin?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Total MB Stored From Parents", value: contentCaching.totalBytesStoredFromParents?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Total MB Stored From Peers", value: contentCaching.totalBytesStoredFromPeers?.convertBytesToMB().formatted(.number) ?? "")
                PropertyView(property: "Total Bytes Since", value: contentCaching.totalBytesAreSince?.getRelativeAndCompleteString() ?? "")
            }
        }
    }
}

#Preview {
    ComputerDetailsContentCachingView(Computer.mockData!.contentCaching!)
}
