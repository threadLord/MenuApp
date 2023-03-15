//
//  RestaurantDetails.swift
//  MENUApp
//
//  Created by Mac on 15.3.23..
//

import SwiftUI

struct ResturantView: View {
    
    @Binding var screenState: Screen
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = RestaurantViewViewModel()
    
    let data: RestaurantData
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                VStack(alignment: .leading) {
                    Image("hero_image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: geometry.size.height / 3 * 2)
                    
                    LowerView(data: data)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: geometry.size.height / 3)
                        .frame(width:  UIScreen.main.bounds.width)
                }
                VStack(alignment:.trailing) {
                    
                    HStack {
                        Spacer()
                        Button {
                            viewModel.logout()
                            dismiss()
                            screenState = .login
                        } label: {
                            Image("logoutButton")
                        }
                        Spacer().frame(width: 16)
                    }
                    Spacer()
                }

            }
            
        }
    }
}

struct LowerView: View {
    let data: RestaurantData
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(data.title)
                .font(Font(CTFont(.menuTitle, size: 22)))
                .fontWeight(.bold)
            
            if !data.welcomeMessage.isEmpty {
                Text(data.welcomeMessage)
                    .font(Font(CTFont(.menuTitle, size: 14)))
                    .foregroundColor(.gray)
            }
            
            Text(data.description)
                .font(Font(CTFont(.menuTitle, size: 14)))
                .lineLimit(2)

            Text(data.servingTimes)
                .font(.caption)
          
        }
        .background(Color.white)
    }
}
