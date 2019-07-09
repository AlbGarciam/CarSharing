//
//  CreateTicketViewController.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

protocol CreateTicketViewControllerProtocol : AnyObject {
    
}

class CreateTicketViewController: UIViewController {

    var presenter: CreateTicketPresenterProtocol!
    
    init() {
        super.init(nibName: nil, bundle: Bundle.init(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CreateTicketViewController: CreateTicketViewControllerProtocol {
    
}
