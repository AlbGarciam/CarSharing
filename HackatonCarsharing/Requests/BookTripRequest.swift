//
//  BookTripRequest.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

struct BookTripRequest: APIRequest {
    
    typealias Response =  Trip
    
    var method: Methods { return .POST }
    
    var path: String { return "/requestSeat" }
    
    var body: Any
    
    init?(with id: String) {
        let dict = ["id": id]
        self.body = dict
    }
    
}
