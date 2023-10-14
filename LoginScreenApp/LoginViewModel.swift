//
//  LoginViewModel.swift
//  LoginScreenApp
//
//  Created by Vasichko Anna on 29.09.2023.
//

import Observation
import SwiftUI

@Observable
final class LoginViewModel {
    var user = User()
    var authenticated = false
    
    private var sampleUsername = "Username"
    private var samplePassword = "Password"
    
    var isLoginButtonDisabled: Bool {
        user.name.isEmpty || user.password.isEmpty
    }
    
    func logOut() {
        user.name = ""
        user.password = ""
       toggleAuthentication()
      //  authenticated.toggle()
    }
    
    func logIn() {
        guard user.name == sampleUsername, user.password == samplePassword else {
            return
        }
        toggleAuthentication()
      //  authenticated.toggle()
    }
    
    private func toggleAuthentication() {
        withAnimation {
            authenticated.toggle()
        }
    }
    
}
