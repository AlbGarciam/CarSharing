//
//  ConfirmationPresenter.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

enum ConfirmationType {
    case driver
    case passenger
}

class ConfirmationPresenter {
    private var confirmationType: ConfirmationType
    private var tripInfo: Trip?
    
    private var _imageName : String = ""
    private var _titleText: String = ""
    private var _subtitleText: String = ""
    private var _descriptionText: String = ""
    private var _buttonText: String = ""
    
    init(confirmationType: ConfirmationType, tripInfo: Trip? = nil) {
        self.confirmationType = confirmationType
        self.tripInfo = tripInfo
        setUpInfo()
    }
    
    private func setUpInfo() {
        switch confirmationType {
        case .driver:
            setUpDriverConfirmation()
        case .passenger:
           setUpPassengerConfirmation()
        }
    }
    
    private func setUpDriverConfirmation() {
        _imageName = ""
        _titleText = "¡Genial!"
        _subtitleText = "Tu viaje acaba de ser publicado."
        _descriptionText = "Espera a que un compañero se ponga en contacto contigo a través de tu teléfono para concretar el viaje."
        _buttonText = "Volver al inicio"
    }
    
    private func setUpPassengerConfirmation() {
        _imageName = ""
        _titleText = "¡Oh yeah!"
        _subtitleText = "Ya tienes tu plaza reservada."
        if let trip = tripInfo {
            _descriptionText = "Acabas de reservar plaza en el coche de <b>\(trip.name.capitalized)</b> para mañana a las \(trip.startTime) h en \(trip.origin)."
        }
        _buttonText = "Contacta con el conductor"
    }
}

extension ConfirmationPresenter : ConfirmationPresenterProtocol {
    
    var imageName: String {
        return _imageName
    }
    
    var titleText: String {
        return _titleText
    }
    
    var subtitleText: String {
        return _subtitleText
    }
    
    var descriptionText: String {
        return _descriptionText
    }
    
    var buttonText: String {
        return _buttonText
    }
    
}
