//
//  APISession.swift
//  APIRequestTest
//
//  Created by Alberto García-Muñoz on 21/06/2019.
//  Copyright © 2019 SoundApp. All rights reserved.
//

import Alamofire

struct APISession {
    static func request<Request: APIRequest>(_ request: Request, _ completion: Request.APIRequestCompletion?) {
        // This is where we have to adapt the framework
        let urlString = request.baseUrl + request.path
        
        if let networkManager = NetworkReachabilityManager(), !networkManager.isReachable {
            // Only because completion returns void and request returns Void
            return completion?(.failure(.network(urlString))) ?? ()
        }
        
        let request = request.getRequest()
        
        Alamofire.request(request).responseData { (response) in
            DispatchQueue.main.async {
                guard let statusCode = response.response?.statusCode else {
                    return completion?(.failure(.unknown(urlString))) ?? ()
                }
                switch statusCode {
                case 200..<300:
                    guard let data = response.data else {
                        return completion?(.failure(.empty(urlString))) ?? ()
                    }
                    if Request.Response.self == Data.self, let data = data as? Request.Response { // Return data instead of codable
                        return completion?(.success(data)) ?? ()
                    }
                    
                    guard let model = try? JSONDecoder().decode(Request.Response.self, from: data) else {
                        return completion?(.failure(.parseData(urlString))) ?? ()
                    }
                    return completion?(.success(model)) ?? ()
                // case 403:
                default:
                    //error
                    let error = APIErrorResponse.init(statusCode, "Service error", urlString, data: response.data)
                    return completion?(.failure(error)) ?? ()
                }
            }
        }
    }
}
