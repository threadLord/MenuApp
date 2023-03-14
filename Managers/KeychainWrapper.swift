//
//  KeychainWrapper.swift
//  MENUApp
//
//  Created by Mac on 10.3.23..
//

import Foundation
import KeychainStored

protocol KeychainWrapperProtocol {
    var token: Token? { get set }
}

class KeychainWrapper: KeychainWrapperProtocol {
    @KeychainStored(service: "user")
    var token: Token?
}
