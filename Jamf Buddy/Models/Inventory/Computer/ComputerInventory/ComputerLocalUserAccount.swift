//
//  ComputerLocalUserAccount.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/8/23.
//

import Foundation

struct ComputerLocalUserAccount: Codable, Hashable, Identifiable {
    let id: UUID = UUID()
    let uid: String
    let userGuid: String?
    let username: String
    let fullName: String?
    let admin: Bool?
    let homeDirectory: String?
    let homeDirectorySizeMb: Int?
    let fileVault2Enabled: Bool?
    let userAccountType: String?
    let passwordMinLength: Int?
    let passwordMaxAge: Int?
    let passwordMinComplexCharacters: Int?
    let passwordHistoryDepth: Int?
    let passwordRequireAlphanumeric: Bool?
    let computerAzureActiveDirectoryId: String?
    let userAzureActiveDirectoryId: String?
    let azureActiveDirectoryId: String?
    
    enum CodingKeys: String, CodingKey {
        case uid
        case userGuid
        case username
        case fullName
        case admin
        case homeDirectory
        case homeDirectorySizeMb
        case fileVault2Enabled
        case userAccountType
        case passwordMinLength
        case passwordMaxAge
        case passwordMinComplexCharacters
        case passwordHistoryDepth
        case passwordRequireAlphanumeric
        case computerAzureActiveDirectoryId
        case userAzureActiveDirectoryId
        case azureActiveDirectoryId
    }
}

extension ComputerLocalUserAccount {
    enum UserType {
        case LocalUserAccount
        case HiddenLocalUserAccount
    }
    
    func hasPasswordData() -> Bool {
        if self.passwordMaxAge != nil ||
            self.passwordMinLength != nil ||
            self.passwordHistoryDepth != nil ||
            self.passwordRequireAlphanumeric != nil ||
            self.passwordMinComplexCharacters != nil {
            return true
        } else {
            return false
        }
    }
    
    func hasAzureData() -> Bool {
        if self.azureActiveDirectoryId != nil ||
            self.userAzureActiveDirectoryId != nil ||
            self.computerAzureActiveDirectoryId != nil {
            return true
        } else {
            return false
        }
    }
}
