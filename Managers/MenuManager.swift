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
//        return keychainWrapper.token?.value
        return "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS1xYS5tZW51LmFwcC9hcGkvY3VzdG9tZXJzL2xvZ2luIiwiaWF0IjoxNjc4NDYxNzQ3LCJleHAiOjE2Nzg0NjUzNDcsIm5iZiI6MTY3ODQ2MTc0NywianRpIjoiSmtBcVBvdWVCdTJpeHFvQSIsInN1YiI6IjkyNjE5MyIsInBydiI6ImNjMzI5MjFhMTU0ODBhMTE3ZDliYmM3MmMwZTEyNTZhNjg1MjQ1OGIiLCJhcHBsaWNhdGlvbl9pZCI6Mywic2Vzc2lvbl9pZCI6NzgyODg1fQ.QsZbWNBIEuN0_7dAZ_Tf5HFLeuZQggq5x9Xl1Eeo9Xw"
    }()
    
    func getData<T: Codable>(urlRequest: URLRequest, type: T.Type) -> AnyPublisher<T, Error> {
        guard let token = token else {
            return Just<T>(NSObject() as! T)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
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
                
        // prepare json data
        let json: [String: Any] = ["latitude": latitude,
                                   "longitude": longitude]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData
        
        return networkManager.getData(urlRequest: request, type: MenuResponse.self)
    }
}
