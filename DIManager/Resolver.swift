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
        //Resolve the interface to an implementation.
        self.wrappedValue = Resolver.shared.resolve(I.self)
    }
}

class Resolver {
    static let shared = Resolver()
    
    //get the IOC container
    private lazy var container = buildContainer()
    
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
    
    func buildContainer() -> Container {
        container.register(LoginManagerProtocol.self) { resolver in
            return LoginManager()
        }.inObjectScope(.container)
        return container
    }
}
