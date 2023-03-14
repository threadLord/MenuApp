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
    @State var coordinator: Screen = .menu
    
    var body: some View {
        
        switch coordinator {
        case .login:
            LoginView()
        case .menu:
            MenuView()
        case .submenu:
            MenuView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
