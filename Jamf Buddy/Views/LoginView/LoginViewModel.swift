//
//  LoginViewModel.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 11/10/23.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var url: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isApiClient: Bool = false
    @Published var showPassword: Bool = false
    
    init(url: String, username: String, password: String, isApiClient: Bool, showPassword: Bool) {
        self.url = url
        self.username = username
        self.password = password
        self.isApiClient = isApiClient
        self.showPassword = showPassword
    }
    
    init() {
        #if DEBUG
        self.url = TestLoginData.url
        self.username = TestLoginData.username
        self.password = TestLoginData.password
        self.isApiClient = TestLoginData.isApiClient
        self.showPassword = TestLoginData.showPassword
        #else
        self.url = ""
        self.username = ""
        self.password = ""
        self.isApiClient = false
        self.showPassword = false
        #endif
    }
}
