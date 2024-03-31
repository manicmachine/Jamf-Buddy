//
//  ContentView.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 11/10/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(JpsService.self) var jpsService: JpsService
    @StateObject private var loginViewModel = LoginViewModel()
    
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Jamf Pro").font(.largeTitle)) {
                    TextField("Jamf Pro URL", text: $loginViewModel.url)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    TextField(loginViewModel.isApiClient ? "Client ID" : "Username", text: $loginViewModel.username)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    HStack {
                        Group {
                            if loginViewModel.showPassword {
                                TextField(loginViewModel.isApiClient ? "Client Secret" : "Password", text: $loginViewModel.password)
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.never)
                            } else {
                                SecureField(loginViewModel.isApiClient ? "Client Secret" : "Password", text: $loginViewModel.password)
                            }
                        }
                        
                        Button {
                            loginViewModel.showPassword.toggle()
                        } label: {
                            Image(systemName: loginViewModel.showPassword ? "eye" : "eye.slash")
                        }
                    }
                    
                    Toggle(isOn: $loginViewModel.isApiClient) {
                        Text("Use API client?")
                    }
                }
                .padding()
                
            }
            
            Button {
                Task {
                    await jpsService.authenticate(url: loginViewModel.url, username: loginViewModel.username, password: loginViewModel.password)
                }
            } label: {
                HStack {
                    Text("Sign In")
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.headline)
            .controlSize(.extraLarge)
            .padding(10)
            .disabled(loginViewModel.url.isEmpty || loginViewModel.username.isEmpty || loginViewModel.password.isEmpty)
        }
    }
}

#Preview {
    LoginView()
        .environment(JpsService())
}
