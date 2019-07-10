//
//  DateFormatter+TripFormatter.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }()
    
    static let tripDate: DateFormatter = {
        let tripDate = DateFormatter()
        tripDate.dateFormat = "dd/MM/yy"
        tripDate.calendar = Calendar(identifier: .iso8601)
        tripDate.timeZone = TimeZone(secondsFromGMT: 0)
        tripDate.locale = Locale(identifier: "en_US_POSIX")
        return tripDate
    }()
    
    static let tripTime: DateFormatter = {
        let tripTime = DateFormatter()
        tripTime.dateFormat = "HH:mm"
        tripTime.calendar = Calendar(identifier: .iso8601)
        tripTime.timeZone = TimeZone(secondsFromGMT: 0)
        tripTime.locale = Locale(identifier: "en_US_POSIX")
        return tripTime
    }()
    
    
}
