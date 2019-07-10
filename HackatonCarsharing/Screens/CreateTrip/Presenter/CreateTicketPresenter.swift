//
//  CreateTicketPresenter.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

protocol CreateTicketPresenterProtocol {
    func inputValuesUpdated()
    func viewIsReady()
    func continueRequested()
}

class CreateTicketPresenter {
    
    weak var view: CreateTicketViewControllerProtocol?
    
    init(view: CreateTicketViewControllerProtocol) {
        self.view = view
    }
    
    private func fetchTripModel() -> Trip? {
        let origin = view?.origin ?? ""
        let contactName = view?.contactName ?? ""
        let contactNumber = view?.contactNumber ?? ""
        let email = view?.email ?? ""
        let totalSeats = Int(view?.totalSeats ?? "")
        let stops = view?.stops
        
        guard !origin.isEmpty,!contactName.isEmpty, !contactNumber.isEmpty, !email.isEmpty, let seats = totalSeats, let date = buildDate(from: view?.startTime, date: view?.startDate) else { return nil }
        
        let dateStr = DateFormatter.dateFormatter.string(from: date)
        return Trip(origin: origin, contact: contactNumber,
                    name: contactName, email: email,
                    totalSeats: seats, availableSeats: seats,
                    startTime: dateStr, stops: stops)
    }
    
    private func buildDate(from hour: Date?, date: Date?) -> Date? {
        guard let hour = hour, let date = date else { return nil }
        let calendar = Calendar.init(identifier: .gregorian)
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        var hourComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: hour)
        // Change the time to 9:30:00 in your locale
        dateComponents.hour = hourComponents.hour
        dateComponents.minute = hourComponents.minute
        dateComponents.second = hourComponents.second
        
        return calendar.date(from: dateComponents)
    }
}

extension CreateTicketPresenter: CreateTicketPresenterProtocol {
    func inputValuesUpdated() {
        view?.isContinueEnabled = fetchTripModel() != nil
    }
    
    func viewIsReady() {
        view?.isContinueEnabled = fetchTripModel() != nil
    }
    
    func continueRequested() {
        guard let trip = fetchTripModel() else { return }
        
        CreateTripsRequest(with: trip)?.makeRequest {[weak self] (result) in
            switch result{
            case .success(let trip):
                self?.view?.navigateToConfirmation()
            case .failure(_):
                self?.view?.navigateToError()
            }
        }
    }
}
