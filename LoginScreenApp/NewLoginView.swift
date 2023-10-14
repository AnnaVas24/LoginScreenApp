//
//  NewLoginView.swift
//  LoginScreenApp
//
//  Created by Vasichko Anna on 02.10.2023.
//

import SwiftUI

struct NewLoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    private var isLoginButtonDisabled: Bool {
        username.isEmpty || password.isEmpty
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Welcome!")
                    .font(.largeTitle)
                    .bold()
                    .padding([.top], 100)
                
                VStack(spacing: 15) {
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300)
                        .background(.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300)
                        .background(.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .padding()
                
                Button1View(isDisabled: isLoginButtonDisabled) {
                    print("Hello")
                }
                
                Spacer()
            }
        }
       
    }
}

#Preview {
    NewLoginView()
}

struct Button1View: View {
    let isDisabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Sign In")
                .foregroundStyle(.white)
                .font(.title2)
                .bold()
        }
        .frame(width: 300, height: 60)
        .background(
            LinearGradient(
                colors: isDisabled
                ? [.gray.opacity(0.6)]
                : [.orange, .blue.opacity(0.5)],
                startPoint: .bottomLeading,
                endPoint: .topTrailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .disabled(isDisabled)
    }
}
