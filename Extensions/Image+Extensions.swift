//
//  Image+Extensions.swift
//  MENUApp
//
//  Created by Mac on 15.3.23..
//

import SwiftUI
import Foundation

extension Image {
    func data(url: String) -> Self {
        if let url = URL(string: url), let data = try? Data(contentsOf: url) {
            
            return Image(uiImage: UIImage(data: data)!)
        }
        
        return self.resizable()
    }
}


struct ImageView: View {
    let imageUrlString: String
    @State private var uiImage: UIImage? = nil
    
    var body: some View {
        if let image = uiImage {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            Color.white
                .frame(width: 50, height: 50)
                .overlay(
                    ProgressView()
                )
                .onAppear {
                    loadImage()
                }
        }
    }
    
    private func loadImage() {
        guard let url = URL(string: imageUrlString) else { return }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.uiImage = image
                }
            }
        }
    }
}
