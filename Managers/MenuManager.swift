//
//  MenuManager.swift
//  MENUApp
//
//  Created by Mac on 14.3.23..
//

import Foundation
import Combine

enum NetworkError: Error {
    case noToken
}

class NetworkManagerAuthenticated: NetworkManagerProtocol {
    
    var token: String? = {
        let keychainWrapper = Resolver.shared.resolve(KeychainWrapperProtocol.self)
        return keychainWrapper.token?.value
    }()
    
    func getData<T: Codable>(urlRequest: URLRequest, type: T.Type) -> AnyPublisher<T, Error> {
        let token = token ?? ""
        
        var request = urlRequest
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ data, resposne in
                return data
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


protocol MenuManagerProtocol {
    var networkManager: NetworkManagerProtocol { get set }
    func fetchMenu(latitude: Double, longitude: Double) -> AnyPublisher<MenuResponse, Error>
}

class MenuManager: MenuManagerProtocol {
    
    var networkManager: NetworkManagerProtocol = Resolver.shared.resolve(NetworkManagerProtocol.self, name: ResolverConstants.authenticatedNetworkProtocol)
    
    let url = "https://api-qa.menu.app/api/directory/search"
    
    func fetchMenu(latitude: Double, longitude: Double) -> AnyPublisher<MenuResponse, Error> {
        let url = URL(string: url)!
        var request = URLRequest.menuRequest(url: url)
                
        let json: [String: Any] = ["latitude": latitude,
                                   "longitude": longitude]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData
        
        return networkManager.getData(urlRequest: request, type: MenuResponse.self)
    }
}
