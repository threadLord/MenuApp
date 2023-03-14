//
//  LoginManager.swift
//  MENUApp
//
//  Created by Mac on 9.3.23..
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func getData<T: Codable>(urlRequest: URLRequest, type: T.Type) -> AnyPublisher<T, Error>
}

struct NetworkManagerUnauthenticated: NetworkManagerProtocol {
    func getData<T: Codable>(urlRequest: URLRequest, type: T.Type) -> AnyPublisher<T, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ data, resposne in
                return data
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

protocol LoginManagerProtocol {
    var url: String { get set }
    var networkManager: NetworkManagerProtocol { get set }
    func login(email: String, password: String) -> AnyPublisher<NetwrokLogin, Error>
}

class LoginManager: LoginManagerProtocol {
    var networkManager: NetworkManagerProtocol = Resolver.shared.resolve(NetworkManagerProtocol.self, name: ResolverConstants.networkManagerUnauthenticated)
    
    
    var url: String = "https://api-qa.menu.app/api/customers/login"
    
    func login(email: String, password: String) -> AnyPublisher<NetwrokLogin, Error> {
        let url = URL(string: url)!
        var request = URLRequest.menuRequest(url: url)
        
        // prepare json data
        let json: [String: Any] = ["email": email,
                                   "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap({ data, resposne in
                return data
            })
            .decode(type: NetwrokLogin.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
