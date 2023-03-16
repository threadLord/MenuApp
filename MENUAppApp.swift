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
        UITableView.appearance().backgroundColor = .white
        UITableViewCell.appearance().backgroundColor = .white
        UICollectionView.appearance().backgroundColor = .white
        UICollectionViewCell.appearance().backgroundColor = .white
        UIScrollView.appearance().backgroundColor = .white
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
