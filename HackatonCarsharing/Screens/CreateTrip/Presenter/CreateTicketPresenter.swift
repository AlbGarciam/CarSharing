//
//  CreateTicketPresenter.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

protocol CreateTicketPresenterProtocol {
    
}

class CreateTicketPresenter {
    
    weak var view: CreateTicketViewControllerProtocol?
    
    init(view: CreateTicketViewControllerProtocol) {
        self.view = view
    }
    
}

extension CreateTicketPresenter: CreateTicketPresenterProtocol {
    
}
