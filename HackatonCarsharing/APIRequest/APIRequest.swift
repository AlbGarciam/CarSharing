//
//  APIRequest.swift
//  APIRequestTest
//
//  Created by Alberto García-Muñoz on 21/06/2019.
//  Copyright © 2019 SoundApp. All rights reserved.
//

import Foundation

enum Methods: String, Codable {
    case GET, POST // Add Update, delete ...
}

protocol APIRequest {
    
    associatedtype Response: Codable // The way to add a generic into a protocol
    
    typealias APIRequestResponse = Result<Response, APIErrorResponse>
    typealias APIRequestCompletion = (APIRequestResponse) -> ()
    
    var method: Methods { get }
    var body: Any { get }
    var baseUrl: String { get }
    var path: String { get }
    var headers: [String:String] { get }
    var parameters: [String:String] { get }
    
}

extension APIRequest {
    var parameters: [String:String] { return [:] }
    var headers: [String:String] { return ["Content-Type":"application/json"] }
    var body: Any { return [:] }
    
    var baseUrl: String { return AppDelegate.endpoint }
    
    func getRequest() -> URLRequest {
        guard var url = URL(string: baseUrl) else {
            fatalError("Impossible to generate url from \(baseUrl)")
        }
        url.appendPathComponent(path)
        // Add components
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            fatalError("Impossible to generate components from \(url)")
        }
        if !parameters.isEmpty {
            components.queryItems = parameters.map{ URLQueryItem(name: $0, value: $1) }
        }
        guard let finalURL = components.url else {
            fatalError("Impossible to retrieve final URL")
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        if method == .POST {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        request.allHTTPHeaderFields = headers
        
        return request
    }
    
    func makeRequest(completion: APIRequestCompletion?) {
        APISession.request(self, completion)
    }
}
