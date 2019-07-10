//
//  ConfirmationController.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    //MARK: MVP
    private let presenter: ConfirmationPresenterProtocol

    //MARK: Initializers
    init(presenter: ConfirmationPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Properties
    private let red = UIColor.init(red: 244, green: 0, blue: 0, alpha: 1)
    private let black = UIColor.init(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    
    private var imageName: String = ""
    private var titleText: String = ""
    private var subtitleText: String = ""
    private var descriptionText: String = ""
    private var buttonText: String = ""
    
    //MARK: UI Components
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!{
        didSet{
            imageView.contentMode = .scaleAspectFit
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.font = UIFont(name: "HelveticaNeue", size: 44)
            titleLabel.textColor = black
        }
    }
    
    @IBOutlet weak var subtitleLabel: UILabel!{
        didSet{
            subtitleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
            subtitleLabel.textColor = black
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet{
            descriptionLabel.font = UIFont(name: "HelveticaNeue", size: 16)
            descriptionLabel.textColor = black
        }
    }
    
    @IBOutlet weak var actionButton: UIButton!{
        didSet{
            actionButton.setTitleColor(.white, for: .normal)
            actionButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 18)
            actionButton.backgroundColor = red
            actionButton.layer.cornerRadius = 6
            actionButton.layer.masksToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewInfo()
        setUpView()
    }
    
    //MARK: Actions
    @IBAction func didTappedOnActionButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTappedOnCloseButton(_ sender: UIButton) {
        close()
    }
    
    //MARK: Functions
    private func setUpViewInfo() {
        imageName = presenter.imageName
        titleText = presenter.titleText
        subtitleText = presenter.subtitleText
        descriptionText = presenter.descriptionText
        buttonText = presenter.buttonText
    }
    
    private func setUpView() {
        imageView.image = UIImage(named: imageName)
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
        descriptionLabel.attributedText = descriptionText.stringFromHTML(fontSize: 16, fontName: "HelveticaNeue", alignment: .center, color: black)
        actionButton.setTitle(buttonText, for: .normal)
    }
    
    private func close(completion: (()->Void)?  = nil) {
        self.dismiss(animated: false, completion: completion)
    }
}
