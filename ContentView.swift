//
//  ContentView.swift
//  MENUApp
//
//  Created by Mac on 9.3.23..
//

import SwiftUI

enum Screen {
    case login
    case menu
    case submenu
}

struct ContentView: View {
    
    @State
    var coordinator: Screen = Resolver.shared.resolve(KeychainWrapperProtocol.self).token != nil ? .menu : .login
    
    var body: some View {
        
        switch coordinator {
        case .login:
            LoginView(screenState: $coordinator)
        case .menu:
            MenuView(screenState: $coordinator)
        case .submenu:
            MenuView(screenState: $coordinator)
//            ResturantView(screenState: $coordinator)
        }
    }
}
