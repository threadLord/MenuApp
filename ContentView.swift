//
//  ContentView.swift
//  MENUApp
//
//  Created by Mac on 9.3.23..
//

import SwiftUI

struct ContentView: View {
    var login = LoginManager()
    let email = "test@testmenu.app"
    let password = "test1234"
    var viewModel = LoginViewModel()
    
    var body: some View {
        Text("Hello, world!")
            .padding().onAppear {
                login.login(email: email, password: password).sink { error in
                    print("Data: \(error)")
                } receiveValue: { data in
                    print("Data: \(data)")
                }.store(in: &viewModel.subscriptions)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
