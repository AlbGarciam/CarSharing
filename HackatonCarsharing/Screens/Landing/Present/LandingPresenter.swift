//
//  LandingPresenter.swift
//  HackatonCarsharing
//
//  Created by Leticia Echarri on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import Foundation

protocol LandingPresenterProtocol: class {
    func createTripAction()
    func searchTripAction()
}

class LandingPresenter {
    
    weak var view: LandingViewControllerProtocol?
    
    init(view: LandingViewControllerProtocol) {
        self.view = view
    }
}

extension LandingPresenter: LandingPresenterProtocol {

    func createTripAction() {
        let nextController = assembler.provideCreateTicket()
        self.view?.getViewController().navigationController?.pushViewController(nextController, animated: true)
    }
    
    func searchTripAction() {
    }
}
