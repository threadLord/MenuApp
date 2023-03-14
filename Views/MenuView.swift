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
    
    var body: some View {
        List(viewModel.menuData, id: \.id) { item in
            CustomCellView(title: item.venue?.name ?? "No name",
                           distance: "\(item.distance)" ?? "",
                           location: item.venue?.address ?? "Location",
                           workTime: "Work time")
        }
    }
}



struct MenuView: View {
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        CustomListView(viewModel: viewModel)
    }
}
