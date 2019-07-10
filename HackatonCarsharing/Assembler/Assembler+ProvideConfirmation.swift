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
        let presenter = ConfirmationPresenter(confirmationType: confirmationType, tripInfo: tripInfo)
        let controller = ConfirmationViewController(presenter: presenter)
        return controller
    }
}
