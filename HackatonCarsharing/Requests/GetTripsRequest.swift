//
//  GetTripsRequest.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

struct GetTripsRequest: APIRequest {
    
    typealias Response =  [Trip]
    
    var method: Methods { return .GET }
    
    var path: String { return "/posts" }
    
}
