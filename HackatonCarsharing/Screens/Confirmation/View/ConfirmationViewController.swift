//
//  ConfirmationController.swift
//  HackatonCarsharing
//
//  Created by Fatima Garcia on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

protocol ConfirmationViewControllerProtocol: class {
    func navigationForDriver()
    func navigationForPassenger()
    func navigationForError()
}

class ConfirmationViewController: UIViewController {
    
    //MARK: MVP
    private var presenter: ConfirmationPresenterProtocol!

    //MARK: Initializers
    init() {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(presenter: ConfirmationPresenterProtocol) {
        self.presenter = presenter
    }
    
    //MARK: Properties
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
            titleLabel.textColor = .vfBlack
        }
    }
    
    @IBOutlet weak var subtitleLabel: UILabel!{
        didSet{
            subtitleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
            subtitleLabel.textColor = .vfBlack
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet{
            descriptionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 16)
            descriptionLabel.textColor = .vfBlack
        }
    }
    
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewInfo()
        setUpView()
    }
    
    //MARK: Actions
    @IBAction func didTappedOnActionButton(_ sender: UIButton) {
        presenter.didTappedOnActionButton()
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
        descriptionLabel.attributedText = descriptionText.stringFromHTML(fontSize: 16, fontName: "Helvetica", alignment: .center, color: .vfBlack)
        actionButton.setTitle(buttonText, for: .normal)
    }
    
    private func close(completion: (()->Void)?  = nil) {
        self.dismiss(animated: true, completion: completion)
    }
}

extension ConfirmationViewController: ConfirmationViewControllerProtocol {
    func navigationForDriver() {
        let navigationController = (UIApplication.shared.delegate as? AppDelegate)?.navigationController
        close {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func navigationForPassenger() {
        close {
            self.presenter.clickToCallAction()
        }
    }
    
    func navigationForError() {
        close()
    }
}
