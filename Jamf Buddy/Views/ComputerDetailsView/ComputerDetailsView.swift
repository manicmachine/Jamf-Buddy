//
//  ComputerDetailsView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/18/23.
//

import Foundation
import SwiftUI

struct ComputerDetailsView: View {
    @Environment(\.isPreview) var isPreview
    @Environment(JpsService.self) var jpsService: JpsService
    
    var computer: Computer
    
    var body: some View {
        List {
            if let general = computer.general {
                ComputerDetailsGeneralView(id: computer.id, general)
            }
            
            if let hardware = computer.hardware {
                ComputerDetailsHardwareView(hardware)
            }
            
            if let operatingSystem = computer.operatingSystem {
                ComputerDetailsOSView(operatingSystem)
            }
            
            if let userAndLocation = computer.userAndLocation {
                ComputerDetailsUserAndLocationView(userAndLocation)
            }
            
            if let security = computer.security {
                ComputerDetailsSecurityView(security)
            }
            
            if let purchasing = computer.purchasing {
                ComputerDetailsPurchasingView(purchasing)
            }
            
            if let storage = computer.storage {
                ComputerDetailsStorageView(storage)
            }
            
            if let extensionAttributes = computer.extensionAttributes {
                ComputerDetailsExtensionAttributeSectionView(extensionAttributes)
            }
            
            if let diskEncryption = computer.diskEncryption {
                ComputerDetailsDiskEncryptionView(diskEncryption)
            }
            
            if let licensedSoftware = computer.licensedSoftware {
                if !licensedSoftware.isEmpty {
                    ComputerDetailsLicensedSoftwareView(licensedSoftware)
                }
            }
            
            if let groupMemberships = computer.groupMemberships {
                NavigationLink {
                    GroupListView(groupMemberships)
                } label: {
                    Text("\(groupMemberships.count) Groups")
                }
                .navigationTitle("Group Membership")
                .disabled(groupMemberships.isEmpty)
            }

            if let applications = computer.applications {
                NavigationLink {
                    ComputerDetailsApplicationsListView(applications)
                } label: {
                    Text("\(applications.count) Applications")
                }
                .navigationTitle("Applications")
                .disabled(applications.isEmpty)
            }
            
            if let profiles = computer.configurationProfiles {
                NavigationLink {
                    ComputerDetailsProfilesListView(profiles)
                } label: {
                    Text("\(profiles.count) Profiles")
                }
                .navigationTitle("Configuration Profiles")
                .disabled(profiles.isEmpty)
            }
            
            if let certificates = computer.certificates {
                NavigationLink {
                    ComputerDetailsCertificatesListView(certificates)
                } label: {
                    Text("\(certificates.count) Certificates")
                }
                .navigationTitle("Certificates")
                .disabled(certificates.isEmpty)
            }
            
            if let receipts = computer.packageReceipts {
                NavigationLink {
                    ComputerDetailsPackageReceiptsListView(receipts)
                } label: {
                    Text("\(receipts.count) Package Receipts")
                }
                .navigationTitle("Package Receipts")
                .disabled(receipts.count == 0)
            }
            
            if let localUserAccounts = computer.localUserAccounts {
                NavigationLink {
                    ComputerDetailsLocalUserAccountsListView(localUserAccounts)
                } label: {
                    let hiddenUserCount = localUserAccounts.reduce(0, { count, user in
                        if let uid = Int(user.uid) {
                            if uid  < 500 {
                                return count + 1
                            }
                        }
                        
                        return count
                    })
                    
                    Text("\(localUserAccounts.count - hiddenUserCount) Local Users, \(hiddenUserCount) Hidden")
                }
                .navigationTitle("Local User Accounts")
                .disabled(localUserAccounts.isEmpty)
            }
            
            if let printers = computer.printers {
                NavigationLink {
                    ComputerDetailsPrintersListView(printers)
                } label: {
                    Text("\(printers.count) Printers")
                }
                .navigationTitle("Printers")
                .disabled(printers.isEmpty)
            }
            
            if let services = computer.services {
                NavigationLink {
                    ComputerDetailsServicesListView(services)
                } label: {
                    Text("\(services.count) Services")
                }
                .navigationTitle("Services")
                .disabled(services.isEmpty)
            }
            
            if let attachments = computer.attachments {
                NavigationLink {
                    ComputerDetailsAttachmentsListView(attachments)
                } label: {
                    Text("\(attachments.count) Attachments")
                }
                .navigationTitle("Attachments")
                .disabled(attachments.isEmpty)
            }
            
            if let plugins = computer.plugins {
                NavigationLink {
                    ComputerDetailsPluginsListView(plugins)
                } label: {
                    Text("\(plugins.count) Plugins")
                }
                .navigationTitle("Plugins")
                .disabled(plugins.isEmpty)
            }
            
            if let fonts = computer.fonts {
                NavigationLink {
                    ComputerDetailsFontsListView(fonts)
                } label: {
                    Text("\(fonts.count) Fonts")
                }
                .navigationTitle("Fonts")
                .disabled(fonts.isEmpty)
            }

            if let ibeacons = computer.ibeacons {
                NavigationLink {
                    ComputerDetailsiBeaconsListView(ibeacons)
                } label: {
                    Text("\(ibeacons.count) iBeacons")
                }
                .navigationTitle("iBeacons")
                .disabled(ibeacons.isEmpty)
            }
            
            if let updates = computer.softwareUpdates {
                NavigationLink {
                    ComputerDetailsSoftwareUpdatesListView(updates)
                } label: {
                    Text("\(updates.count) Software Updates")
                }
                .navigationTitle("Software Updates")
                .disabled(updates.isEmpty)
            }
            
            if let contentCaching = computer.contentCaching {
                NavigationLink {
                    ComputerDetailsContentCachingView(contentCaching)
                } label: {
                    Text("Content Caching")
                }
                .navigationTitle("Content Caching")
            }
        }
        .navigationTitle(computer.general!.name)
        .textSelection(.enabled)
        .onAppear(perform: {
            if !isPreview {
                Task {
                    self.computer.update(from: try await jpsService.getComputerDetails(for: computer))
                }
            }
        })
        .refreshable {
            Task {
                try await jpsService.getComputerDetails(for: computer)
            }
        }
    }
}

#Preview {
    return ComputerDetailsView(computer: Computer.mockData!)
}

