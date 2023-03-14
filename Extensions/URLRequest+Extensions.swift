//
//  URLRequest+Extensions.swift
//  MENUApp
//
//  Created by Mac on 14.3.23..
//

import Foundation

extension URLRequest {
    static func menuRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("mobile-application", forHTTPHeaderField: "application")
        request.setValue("123456", forHTTPHeaderField: "Device-UUID")
        request.setValue("3.7.0", forHTTPHeaderField: "Api-Version")
        return request
    }
}
