//
//  UINavigationController+NavBar.swift
//  HackatonCarsharing
//
//  Created by Leticia Echarri on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func appearance() {
        
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
        
        let backButtonAppearance = UIBarButtonItem.appearance()
        backButtonAppearance.setBackgroundImage(UIImage(named: "icArrowLeft"), for: .normal, barMetrics: .default)
    }
}
