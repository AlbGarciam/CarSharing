//
//  ConfirmationPresenter.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation
import UIKit

enum ConfirmationType {
    case driver
    case passenger
    case error
}

class ConfirmationPresenter {
    
    weak var view: ConfirmationViewControllerProtocol?
    
    private var confirmationType: ConfirmationType
    private var tripInfo: Trip?
    
    private var _imageName : String = ""
    private var _titleText: String = ""
    private var _subtitleText: String = ""
    private var _descriptionText: String = ""
    private var _buttonText: String = ""
    
    init(view: ConfirmationViewControllerProtocol, confirmationType: ConfirmationType, tripInfo: Trip? = nil) {
        self.view = view
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
        case .error:
            setUpError()
        }
    }
    
    private func setUpDriverConfirmation() {
        _imageName = "confirmation_success_driver"
        _titleText = "¡Genial!"
        _subtitleText = "Tu viaje acaba de ser publicado."
        _descriptionText = "Espera a que un compañero se ponga en contacto contigo a través de tu teléfono para concretar el viaje."
        _buttonText = "Volver al inicio"
    }
    
    private func setUpPassengerConfirmation() {
        _imageName = "confirmation_success_passenger"
        _titleText = "¡Oh yeah!"
        _subtitleText = "Ya tienes tu plaza reservada."
        if let trip = tripInfo {
            let date = DateFormatter.dateFormatter.date(from: tripInfo?.startTime ?? "") ?? Date()
            let tripDate = DateFormatter.tripDate.string(from: date)
            let tripTime = DateFormatter.tripTime.string(from: date)
            _descriptionText = "Acabas de reservar plaza en el coche de <b>\(trip.name.capitalized)</b> para el día \(tripDate) a las \(tripTime) h en \(trip.origin)."
        }
        _buttonText = "Contacta con el conductor"
    }
    
    private func setUpError() {
        _imageName = "ko_image"
        _titleText = "¡Ups!"
        _subtitleText = "Parece que algo ha salido mal."
        _descriptionText = ""
        _buttonText = "Volver a intentar"
    }
    
    private func callToNumber() {

        if let trip = tripInfo, let url = URL(string: "tel://\(trip.contact)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    private func clickToChat() {
        if let trip = tripInfo {
            let text = "!Hola%20\(trip.name.capitalized)!%20Quiero%20compartir%20viaje%20contigo%20"
            if let url = URL(string: "https://wa.me/34\(trip.contact)?text=\(text)"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
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
    
    func didTappedOnActionButton() {
        switch confirmationType {
        case .driver:
            view?.navigationForDriver()
        case .passenger:
            view?.navigationForPassenger()
        case .error:
            view?.navigationForError()
        }
    }
    
    func didTapOnClose() {
        switch confirmationType {
        case .driver:
            view?.navigationForDriver()
        case .passenger:
            view?.close(completion: nil)
        case .error:
            view?.close(completion: nil)
        }
    }
    
    func clickToCallAction() {
        self.callToNumber()
    }
    
    func clickToChatAction() {
        self.clickToChat()
    }
    
    func shouldHideChatButton() -> Bool {
        return confirmationType == .passenger
    }
}
