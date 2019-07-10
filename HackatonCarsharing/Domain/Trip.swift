//
//  Trip.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

struct Trip {

    let id: String
    let origin: String
    let destination: String
    let contact: String
    let name: String
    let email: String
    let totalSeats: Int
    let availableSeats: Int
    let startTime: String
    let stops: String?

    init(id: String = "", origin: String, destination: String = "Vodafone Plaza", contact: String,
         name: String, email: String, totalSeats: Int,
         availableSeats: Int, startTime: String, stops: String?) {
        self.id = id
        self.origin = origin
        self.destination = destination
        self.contact = contact
        self.name = name
        self.email = email
        self.totalSeats = totalSeats
        self.availableSeats = availableSeats
        self.startTime = startTime
        self.stops = stops
    }
    
}

extension Trip: Codable {
    fileprivate enum CodingKeys: String, CodingKey {
        case id = "_id"
        case origin
        case destination
        case contact
        case name
        case email
        case totalSeats
        case availableSeats
        case startTime
        case stops
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let origin = try container.decode(String.self, forKey: .origin)
        let destination = try container.decode(String.self, forKey: .destination)
        let contact = try container.decode(String.self, forKey: .contact)
        let name = try container.decode(String.self, forKey: .name)
        let email = try container.decode(String.self, forKey: .email)
        let totalSeats = try container.decode(Int.self, forKey: .totalSeats)
        let availableSeats = try container.decode(Int.self, forKey: .availableSeats)
        let startTime = try container.decode(String.self, forKey: .startTime)
        let stops = try container.decodeIfPresent(String.self, forKey: .stops)
        
        self.init(id: id, origin: origin, destination: destination, contact: contact,
                  name: name, email: email, totalSeats: totalSeats, availableSeats: availableSeats,
                  startTime: startTime, stops: stops)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(origin, forKey: .origin)
        try container.encode(destination, forKey: .destination)
        try container.encode(contact, forKey: .contact)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(totalSeats, forKey: .totalSeats)
        try container.encode(availableSeats, forKey: .availableSeats)
        try container.encode(startTime, forKey: .startTime)
        try container.encodeIfPresent(stops, forKey: .stops)
    }
}
