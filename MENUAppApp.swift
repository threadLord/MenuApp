//
//  MENUAppApp.swift
//  MENUApp
//
//  Created by Mac on 9.3.23..
//

import SwiftUI

@main
struct MENUAppApp: App {
    init() {
        Resolver.shared.buildCont()
    }
    var body: some Scene {
        WindowGroup {
//            ResturantView()
            ContentView()
        }
    }
}
