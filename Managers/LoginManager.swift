//
//  LoginManager.swift
//  MENUApp
//
//  Created by Mac on 9.3.23..
//

import Foundation
import Combine

protocol NetworkManager {
    func getData<T>(urlRequest: URLRequest, type: T.Type) -> T
}

protocol LoginManagerProtocol {
    var url: String { get set }
    func login(email: String, password: String) -> AnyPublisher<NetwrokLogin, Error>
}

class LoginManager: LoginManagerProtocol {
    var url: String = "https://api-qa.menu.app/api/customers/login"
    
    func login(email: String, password: String) -> AnyPublisher<NetwrokLogin, Error> {
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("mobile-application", forHTTPHeaderField: "application")
        request.setValue("123456", forHTTPHeaderField: "Device-UUID")
        request.setValue("3.7.0", forHTTPHeaderField: "Api-Version")
        
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
