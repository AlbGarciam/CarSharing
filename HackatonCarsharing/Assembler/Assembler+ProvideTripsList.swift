//
//  Assembler+ProvideListTrips.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

extension Assembler {
    func provideTripsList() -> UIViewController {
        let controller = ListTripsViewController()
        let presenter = TripsListPresenter(view: controller)
        controller.configure(presenter: presenter)
        return controller
    }
}
