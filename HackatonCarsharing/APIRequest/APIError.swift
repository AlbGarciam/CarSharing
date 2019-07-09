//
//  APIError.swift
//  APIRequestTest
//
//  Created by Alberto García-Muñoz on 21/06/2019.
//  Copyright © 2019 SoundApp. All rights reserved.
//

import Foundation

class APIErrorResponse : Error {
    var url: String
    var statusCode: Int
    var data: Data?
    var message: String
    
    init(_ statusCode: Int, _ message: String, _ url: String, data: Data? = nil) {
        // Every time we add default values we have can't add _ as external name
        (self.url, self.statusCode, self.data, self.message) = (url, statusCode, data, message)
    }
}

extension APIErrorResponse {
    static func network(_ url: String) -> APIErrorResponse {
        return APIErrorResponse(-1, "Network connection error", url)
    }
    
    static func parseData(_ url: String) -> APIErrorResponse {
        return APIErrorResponse(-2, "Cannot parse data from URL", url)
    }
    
    static func unknown(_ url: String) -> APIErrorResponse {
        return APIErrorResponse(-3, "Unknown error", url)
    }
    
    static func empty(_ url: String) -> APIErrorResponse {
        return APIErrorResponse(-4, "Empty data", url)
    }
}

extension APIErrorResponse: Equatable {
    static func == (lhs: APIErrorResponse, rhs: APIErrorResponse) -> Bool {
        return lhs.statusCode == rhs.statusCode
    }
}
