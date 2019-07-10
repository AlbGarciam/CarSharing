//
//  LandingViewController.swift
//  HackatonCarsharing
//
//  Created by Leticia Echarri on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: Bundle.init(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createTripAction(_ sender: UIButton) {
        let nextController = assembler.provideCreateTicket()
        navigationController?.pushViewController(nextController, animated: true)
    }
    
    @IBAction func searchTripAction(_ sender: UIButton) {
    }
}
