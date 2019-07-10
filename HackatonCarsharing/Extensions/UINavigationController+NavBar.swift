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
        
        // Navigation Bar
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
        self.navigationBar.tintColor = .black
        
        // Title Font
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18)!]

        // Back button
        self.navigationBar.backIndicatorImage = UIImage(named: "icArrowLeft")
        self.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icArrowLeft")
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        
    }
}
