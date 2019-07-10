//
//  LandingViewController.swift
//  HackatonCarsharing
//
//  Created by Leticia Echarri on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel! {
        didSet {
            lblTitle.text = "Comparte coche para llegar cada mañana a Vodafone Plaza "
            lblTitle.numberOfLines = 0
            lblTitle.sizeToFit()
        }
    }
    
    @IBOutlet weak var imgPicture: UIImageView! {
        didSet {
            imgPicture.frame.size = CGSize(width: 278, height: 214)
        }
    }
    
    @IBOutlet weak var btnSearchTrip: UIButton! {
        didSet {
            btnSearchTrip.setTitle("Busco un viaje", for: .normal)
        }
    }
    
    @IBOutlet weak var btnCreateTrip: UIButton! {
        didSet {
            btnCreateTrip.setTitle("Compartir mi coche", for: .normal)
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: Bundle.init(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        self.title = ""
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
