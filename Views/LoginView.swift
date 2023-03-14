//
//  LoginView.swift
//  MENUApp
//
//  Created by Mac on 10.3.23..
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    let email1 = "test@testmenu.app"
    let password1 = "test1234"
    
    
    @ObservedObject
    var viewModel: LoginViewModel = Resolver.shared.resolve(LoginViewModel.self)
    
    var body: some View {
        GeometryReader { geometry in
            
        
        VStack(spacing: 20) {
            VStack(spacing: 8) {
                Spacer()///.frame(height: 20)
        
//                Image("logo")
//                    .resizable()
//                    .frame(width: 100, height: 100)
                Spacer().frame(height: 86.5)
                VStack(spacing: 4) {
                    Text("The easiest way to order")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("No lines. No waiting.")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
            }
            Spacer().frame(height: 20)
            VStack(spacing: 16) {
                TextField("Email", text: $email)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(Color.white)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 5)
//                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
//                    )
                    .cornerRadius(5)
                
                Divider()
                 .frame(height: 1)
                 .padding(.horizontal, 0)
                 .background(Color.gray.opacity(0.5))
                 .offset(x: 0, y: -10)
                
                SecureField("Password", text: $password)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(Color.white)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 5)
//                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
//                    )
                    .cornerRadius(5)
               
                Divider()
                 .frame(height: 1)
                 .padding(.horizontal, 0)
                 .background(Color.gray.opacity(0.5))
                 .offset(x: 0, y: -10)
            }
            .padding(.horizontal)
            Spacer()
            
            Button(action: {
                viewModel.loginWithData.send((email,password))
            }) {
//                Image("loginButton")
//                    .resizable()
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 56)
//                    .cornerRadius(5)
            }
//            .padding(.horizontal)
            
            Spacer()
                .frame(height: 20)
        }
        .padding()
        .background(Color.white)
        .padding(.bottom)
        }
    }
}

