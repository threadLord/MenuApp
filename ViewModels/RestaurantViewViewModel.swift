//
//  RestaurantViewViewModel.swift
//  MENUApp
//
//  Created by Mac on 15.3.23..
//

import Foundation
import Combine

class RestaurantViewViewModel: ObservableObject {
    var keychainWrapper = Resolver.shared.resolve(KeychainWrapperProtocol.self)
    
    func logout() {
        keychainWrapper.token = nil
        
    }
}
