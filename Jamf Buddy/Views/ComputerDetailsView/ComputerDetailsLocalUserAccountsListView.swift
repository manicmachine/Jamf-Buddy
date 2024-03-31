//
//  ComputerDetailsLocalUserAccountsListView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/27/23.
//

import SwiftUI

struct ComputerDetailsLocalUserAccountsListView: View {
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    private var isCompact: Bool { horizontalSizeClass == .compact }
#else
    private let isCompact = false
#endif
    
    @State private var sortOrder = [KeyPathComparator(\ComputerLocalUserAccount.username)]
    @State var showType: ComputerLocalUserAccount.UserType = .LocalUserAccount
    
    let localUserAccounts: [ComputerLocalUserAccount]
    
    var displayLocalUsers: [ComputerLocalUserAccount] {
        switch showType {
        case .LocalUserAccount:
            return visibleLocalUsers
        case .HiddenLocalUserAccount:
            return hiddenLocalUsers
        }
    }
    
    var visibleLocalUsers: [ComputerLocalUserAccount] {
        return self.localUserAccounts.filter {
            if let uid = Int($0.uid) {
                if uid > 500 {
                    return true
                }
            }
            
            return false
        }
    }
    
    var hiddenLocalUsers: [ComputerLocalUserAccount] {
        return self.localUserAccounts.filter {
            if let uid = Int($0.uid) {
                if uid <= 500 {
                    return true
                }
            }
            
            return false
        }
    }
    
    init(_ localUserAccounts: [ComputerLocalUserAccount]) {
        self.localUserAccounts = localUserAccounts.sorted { $0.username < $1.username }
    }

    var body: some View {
        VStack {
            Picker("Account Type", selection: $showType) {
                Text("Local User Account").tag(ComputerLocalUserAccount.UserType.LocalUserAccount)
                Text("Hidden Local User Account").tag(ComputerLocalUserAccount.UserType.HiddenLocalUserAccount)
            }
            .pickerStyle(.segmented)
            .padding([.bottom, .horizontal])

            Table(displayLocalUsers, sortOrder: $sortOrder) {
                TableColumn("Username", value: \.username) { user in
                    VStack(alignment: .leading) {
                        PropertyView(property: "Username", value: user.username)
                        
                        if isCompact {
                            PropertyView(property: "Full Name", value: user.fullName ?? "")
                            PropertyView(property: "Admin", value: user.admin?.description ?? "")
                            PropertyView(property: "Home Directory", value: user.homeDirectory ?? "")
                            PropertyView(property: "Home Directory Size MB", value: user.homeDirectorySizeMb?.formatted(.number) ?? "")
                            PropertyView(property: "User Account Type", value: user.userAccountType ?? "")
                            
                            if user.hasPasswordData() {
                                NavigationLink {
                                    ComputerDetailsLocalUserAccountPasswordDetailsView(user: user)
                                } label: {
                                    Text("Password Settings")
                                }
                            }
                            if user.hasAzureData() {
                                NavigationLink {
                                    ComputerDetailsLocalUserAccountAzureDetailsView(user: user)
                                } label: {
                                    Text("Azure Settings")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ComputerDetailsLocalUserAccountsListView(Computer.mockData!.localUserAccounts!)
}
