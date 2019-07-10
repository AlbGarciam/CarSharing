//
//  Assembler+ProvideCreateTicket.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

extension Assembler {
    func provideCreateTicket() -> UIViewController {
        let controller = CreateTicketViewController()
        let presenter = CreateTicketPresenter(view: controller)
        controller.presenter = presenter
        return controller
    }
}
