//
//  UIViewController+Loader.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 10/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

extension UIViewController {
    func showLoading() {
        let loader = SpinnerView(frame: view.bounds)
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loader)
        
        loader.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loader.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loader.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loader.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func hideLoading() {
        view.subviews.filter { $0 is SpinnerView }.forEach { $0.removeFromSuperview() }
    }
}
