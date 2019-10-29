//
//  CreateTripsRequest.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

struct CreateTripsRequest: APIRequest {
    
    typealias Response =  Trip
    
    var method: Methods { return .POST }
    
    var path: String { return "/createTrip" }

    var body: Any
    
    init?(with trip: Trip) {
        guard let data = try? JSONEncoder().encode(trip),
            let dict = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else { return nil }
        self.body = dict
    }
    
}
