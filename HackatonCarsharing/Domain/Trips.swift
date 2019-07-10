//
//  Trips.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

struct Trips {
    
    private(set) var trips: [Trip]?
    
    init(trips: [Trip]) {
        self.trips = trips
    }
}

extension Trips: Codable {
    fileprivate enum CodingKeys: String, CodingKey {
        case trips
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let trips = try container.decode([Trip].self, forKey: .trips)
        self.init(trips: trips)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(trips, forKey: .trips)
    }
}
