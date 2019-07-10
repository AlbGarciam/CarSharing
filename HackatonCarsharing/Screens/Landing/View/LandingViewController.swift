//
//  LandingViewController.swift
//  HackatonCarsharing
//
//  Created by Leticia Echarri on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

protocol LandingViewControllerProtocol: class {
    func getViewController() -> LandingViewController
}

class LandingViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel! {
        didSet {
            lblTitle.text = "Comparte coche para llegar cada mañana a Vodafone Plaza "
            lblTitle.numberOfLines = 0
            lblTitle.textColor = .vfBlack
            lblTitle.sizeToFit()
        }
    }
    
    @IBOutlet weak var imgPicture: UIImageView! {
        didSet {
            imgPicture.frame.size = CGSize(width: 278, height: 214)
        }
    }
    
    @IBOutlet weak var btnSearchTrip: LandingButtonView! {
        didSet {
            btnSearchTrip.customLabel.text = "Busco un viaje"
        }
    }
    
    @IBOutlet weak var btnCreateTrip: LandingButtonView! {
        didSet {
            btnCreateTrip.customLabel.text = "Compartir mi coche"
        }
    }
    
    var presenter: LandingPresenterProtocol!
    
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
    
    func configure(presenter: LandingPresenterProtocol) {
        self.presenter = presenter
    }

    @IBAction func createTripAction(_ sender: UIButton) {
        presenter.createTripAction()
    }
    
    @IBAction func searchTripAction(_ sender: UIButton) {
        presenter.searchTripAction()
    }
}

extension LandingViewController: LandingViewControllerProtocol {
    
    func getViewController() -> LandingViewController {
        return self
    }
}
