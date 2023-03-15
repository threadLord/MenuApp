//
//  MenuView.swift
//  MENUApp
//
//  Created by Mac on 10.3.23..
//

import SwiftUI

struct CustomCellView: View {
    let title: String
    let distance: String
    let location: String
    let workTime: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
            Text(distance)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(location)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(workTime)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct CustomListView: View {
    @ObservedObject var viewModel: MenuViewModel
    @Binding var screenState: Screen
    
    var body: some View {
        MenuNavigation {
            List(viewModel.menuData, id: \.id) { item in
                NavigationLink {
                    ResturantView(screenState: $screenState, data: item)
                } label: {
                    
                    
                        CustomCellView(title: item.title ,
                                       distance: item.distance,
                                       location: item.address,
                                       workTime: item.servingTimes)
                }
            }
        }
        
    }
}

struct MenuView: View {
    @StateObject var viewModel = MenuViewModel()
    @Binding var screenState: Screen
    
    var body: some View {
        CustomListView(viewModel: viewModel, screenState: $screenState)
    }
}


struct MenuNavigation<Content>: View where Content: View {
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        if #available(iOS 16, *) {
            NavigationStack(root: content)
        } else {
            NavigationView(content: content)
        }
    }
}
