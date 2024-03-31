//
//  ComputerDetailsLocalUserAccountPasswordDetailsView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/27/23.
//

import SwiftUI

struct ComputerDetailsLocalUserAccountPasswordDetailsView: View {
    let passwordMinLength: Int?
    let passwordMaxAge: Int?
    let passwordMinComplexCharacters: Int?
    let passwordHistoryDepth: Int?
    let passwordRequireAlphanumeric: Bool?
    
    init(user: ComputerLocalUserAccount) {
        self.passwordMinLength = user.passwordMinLength
        self.passwordMaxAge = user.passwordMaxAge
        self.passwordMinComplexCharacters = user.passwordMinComplexCharacters
        self.passwordHistoryDepth = user.passwordHistoryDepth
        self.passwordRequireAlphanumeric = user.passwordRequireAlphanumeric
    }

    var body: some View {
        List {
            PropertyView(property: "Password Min Length", value: passwordMinLength?.description ?? "")
            PropertyView(property: "Password Max Age", value: passwordMaxAge?.description ?? "")
            PropertyView(property: "Password Min Complex Characters", value: passwordMinComplexCharacters?.description ?? "")
            PropertyView(property: "Password History Depth", value: passwordHistoryDepth?.description ?? "")
            PropertyView(property: "Password Require Alphanumeric", value: passwordRequireAlphanumeric?.description ?? "")
        }
    }
}

#Preview {
    ComputerDetailsLocalUserAccountPasswordDetailsView(user: Computer.mockData!.localUserAccounts![0])
}
