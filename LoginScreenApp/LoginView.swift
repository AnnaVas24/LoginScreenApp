//
//  ContentView.swift
//  LoginScreenApp
//
//  Created by Vasichko Anna on 29.09.2023.
//

import SwiftUI

struct LoginView: View {
    @Bindable var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color(.blue.opacity(0.03))
            
            VStack {
                Text("Welcome!")
                    .font(.largeTitle)
                    .bold()
                    .padding([.top], 200)
                
                
                VStack(spacing: 15) {
                    TextField("Username", text: $viewModel.user.name)
                        .customStyle()
                    SecureField("Password", text: $viewModel.user.password)
                        .customStyle()
                }
                .padding()
                
                ButtonView(isDisabled: viewModel.isLoginButtonDisabled) {
                    viewModel.logIn()
                }
               
                Spacer()
            }
            
        }
        .transition(.slide)
    }
}

#Preview {
    LoginView(viewModel: ViewModel())
}

struct TFStyleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 300)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

extension View {
    func customStyle() -> some View {
        modifier(TFStyleViewModifier())
    }
}

struct ButtonView: View {
    var isDisabled: Bool
    var action: () -> Void
    
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
