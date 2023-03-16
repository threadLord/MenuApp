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
    @Binding var screenState: Screen
    @State private var showAlert = false
    
    @ObservedObject
    var viewModel: LoginViewModel = Resolver.shared.resolve(LoginViewModel.self)
    
    var body: some View {
        GeometryReader { geometry in
            
        
        VStack(spacing: 20) {
            VStack(spacing: 8) {
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
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
                TextField("", text: $email)
                    .placeholder(when: email.isEmpty, placeholder: {
                        Text("Email").foregroundColor(.gray)
                    })
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .cornerRadius(5)
                
                Divider()
                 .frame(height: 1)
                 .padding(.horizontal, 0)
                 .background(Color.gray.opacity(0.5))
                 .offset(x: 0, y: -10)
                
                SecureField("", text: $password)
                    .placeholder(when: email.isEmpty, placeholder: {
                        Text("Password").foregroundColor(.gray)
                    })
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(5)
               
                Divider()
                 .frame(height: 1)
                 .padding(.horizontal, 0)
                 .background(Color.gray.opacity(0.5))
                 .offset(x: 0, y: -10)
            }
            .padding(.horizontal)
            Spacer()
            
            Button {
                viewModel.loginWithData.send((email,password))
            } label: {
                Text("Sign in")
                    .frame(width: geometry.size.width - 24 * 2 , height: 56)
                    .font(Font(CTFont(.pushButton, size: 20)).bold())
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(uiColor: UIColor(red: 242/256, green: 97/256, blue: 61/256, alpha: 1)))

            Spacer()
                .frame(height: 20)
        }
        .padding()
        .background(Color.white)
        .padding(.bottom)
        }
        .onReceive(viewModel.$isLoggedIn) { user in
            if user == true {
                screenState = .menu
            }
        }
        .onReceive(viewModel.$error, perform: { error in
            guard error != nil else {
                return
            }
            showAlert = true
        })
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Check your Email or password"), dismissButton: .default(Text("OK")))
        }
    }
}

