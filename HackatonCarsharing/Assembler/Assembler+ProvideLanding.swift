//
//  Assembler+ProvideLanding.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

extension Assembler {
    func provideLanding() -> UIViewController {
        let controller = LandingViewController()
        // Initiate presenter and configure MVP
        return controller
    }
}
