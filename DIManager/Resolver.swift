//
//  Resolver.swift
//  MENUApp
//
//  Created by Mac on 9.3.23..
//

import Foundation
import Swinject
import Combine


@propertyWrapper
struct Inject<I> {
    let wrappedValue: I
    init() {
        self.wrappedValue = Resolver.shared.resolve(I.self)
    }
}

class Resolver {
    static let shared = Resolver()
    
    private var container = Container()
    
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
    
    func resolve<T>(_ type: T.Type, name: String) -> T {
        container.resolve(T.self, name: name)!
    }
    
    func buildCont() {
        container.register(LoginManagerProtocol.self) { resolver in
            return LoginManager()
        }.inObjectScope(.container)
        
        container.register(LoginViewModel.self) { resolver in
            let loginViewModel = LoginViewModel()
            return loginViewModel
        }
        
        container.register(KeychainWrapperProtocol.self) { resolver in
            return KeychainWrapper()
        }.inObjectScope(.container)
        
        container.register(MenuManagerProtocol.self) { resolver in
            return MenuManager()
        }.inObjectScope(.container)
        
        container.register(NetworkManagerProtocol.self, name: ResolverConstants.authenticatedNetworkProtocol) { resolver in
            return NetworkManagerAuthenticated()
        }.inObjectScope(.container)
        
        container.register(NetworkManagerProtocol.self, name: ResolverConstants.networkManagerUnauthenticated) { resolver in
            return NetworkManagerUnauthenticated()
        }.inObjectScope(.container)
    }
}


struct ResolverConstants {
    static let authenticatedNetworkProtocol = "AuthenticatedNetworkProtocol"
    static let networkManagerUnauthenticated = "NetworkManagerProtocol"
}
