//
//  ConfirmationPresenterProtocol.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

protocol ConfirmationPresenterProtocol : class {
    var imageName: String { get }
    var titleText: String { get }
    var subtitleText: String { get }
    var descriptionText: String { get }
    var buttonText: String { get }
    func didTappedOnActionButton()
    func clickToCallAction()
    func didTapOnClose()
}
