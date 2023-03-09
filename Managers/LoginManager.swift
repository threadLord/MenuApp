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
    func login(email: String, password: String) -> AnyPublisher<LoginData, Error>
}

class LoginManager: LoginManagerProtocol {
    var url: String = "https://api-qa.menu.app/api/customers/login"
    
    func login(email: String, password: String) -> AnyPublisher<LoginData, Error> {
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application", forHTTPHeaderField: "mobile-application")
        request.setValue("Device-UUID", forHTTPHeaderField: "123456")
        request.setValue("Api-Version", forHTTPHeaderField: "3.7.0")
        let authData = (email + ":" + password).data(using: .utf8)!.base64EncodedString()
        request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
        
    
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap({ data, resposne in
                return data
            })
            .decode(type: LoginData.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
