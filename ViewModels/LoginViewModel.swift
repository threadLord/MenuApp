//
//  LoginViewModel.swift
//  MENUApp
//
//  Created by Mac on 9.3.23..
//

import Combine
import Foundation


protocol LoginViewModelProtocol  {
//    var loginManager: LoginManagerProtocol { get }
    var user: LoginData? { get set }
    var loginWithData: PassthroughSubject<(String, String), Error> { get }
}

class LoginViewModel: ObservableObject, LoginViewModelProtocol {
    
    typealias EmailAndPassword = (String, String)
    
    @Inject
    internal var loginManager: LoginManagerProtocol
    
//    @Inject
    private var keychainWrapper = KeychainWrapper()
    
    @Published
    var user: LoginData?
    
    @Published
    var error: Error?
    
    var subscriptions = Set<AnyCancellable>()
    
    var loginWithData = PassthroughSubject<(String, String), Error>()
    
    init() {
        subscribe()
    }
    
    func subscribe() {
        loginWithData
            .flatMap { [weak self] email, password -> AnyPublisher<LoginData?, Never> in
                return self?.loginManager
                    .login(email: email, password: password)
                    .tryMap { $0.data }
                    
                    .catch { [weak self] error -> AnyPublisher<LoginData?, Never> in
                          self?.error = error
                        return Just(nil)
                            .eraseToAnyPublisher()
                    }
                    .eraseToAnyPublisher() ?? Just(nil).eraseToAnyPublisher()
            }
            .replaceError(with: nil)
            .print("MARKO: Debug login")
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
            .assign(to: &$user)
        
        $user
            .sink {[ self] data in
                guard
                    let token = data?.token
                else {
                    return
                }
            
                self.keychainWrapper.token = token
        }

    }
    
    func login(email: String, password: String) {
        
    }
    
}
