//
//  ComputerDetailsLocalUserAccountAzureDetailsView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/27/23.
//

import SwiftUI

struct ComputerDetailsLocalUserAccountAzureDetailsView: View {
    let computerAzureActiveDirectoryId: String?
    let userAzureActiveDirectoryId: String?
    let azureActiveDirectoryId: String?
    
    init(user: ComputerLocalUserAccount) {
        self.computerAzureActiveDirectoryId = user.computerAzureActiveDirectoryId
        self.userAzureActiveDirectoryId = user.userAzureActiveDirectoryId
        self.azureActiveDirectoryId = user.azureActiveDirectoryId
    }

    var body: some View {
        List {
            PropertyView(property: "Azure Active Directory ID", value: azureActiveDirectoryId ?? "")
            PropertyView(property: "Computer Azure Active Directory ID", value: computerAzureActiveDirectoryId ?? "")
            PropertyView(property: "User Azure Active Directory ID", value: userAzureActiveDirectoryId ?? "")
        }
    }
}

#Preview {
    ComputerDetailsLocalUserAccountAzureDetailsView(user: Computer.mockData!.localUserAccounts![0])
}
