//
//  Assembler+ProvideConfirmation.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

extension Assembler {
    func provideConfirmation(confirmationType: ConfirmationType, tripInfo: Trip? = nil) -> UIViewController {
        let controller = ConfirmationViewController()
        let presenter = ConfirmationPresenter(view: controller, confirmationType: confirmationType, tripInfo: tripInfo)
        controller.configure(presenter: presenter)
        return controller
    }
}
