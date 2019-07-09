//
//  LandingViewController.swift
//  HackatonCarsharing
//
//  Created by Leticia Echarri on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel! {
        didSet {
            lblTitle.text = "Comparte coche para llegar cada mañana a Vodafone Plaza "
            lblTitle.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var imgPicture: UIImageView! {
        didSet {
            imgPicture.frame.size = CGSize(width: 278, height: 214)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createTripAction(_ sender: UIButton) {
    }
    
    @IBAction func searchTripAction(_ sender: UIButton) {
    }
}
