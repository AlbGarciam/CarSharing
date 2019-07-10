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
    
    @IBOutlet weak var titleFirstSectionLabel: UILabel! {
        didSet {
            titleFirstSectionLabel.text = "Cuéntanos sobre ti"
        }
    }
    @IBOutlet weak var titleSecondSectionLabel: UILabel! {
        didSet {
            titleSecondSectionLabel.text = "Ahora sobre tu ruta hasta Vodafone"
        }
    }
    @IBOutlet weak var contactNameTextField: CustomTextField! {
        didSet {
            contactNameTextField.setPlaceholder(text: "Nombre y apellido")
            contactNameTextField.delegate = self
        }
    }
    @IBOutlet weak var corporateEmailTextField: CustomTextField!{
        didSet {
            corporateEmailTextField.setPlaceholder(text: "Email corporativo")
            corporateEmailTextField.delegate = self
        }
    }
    @IBOutlet weak var contactNumberTextField: CustomTextField!{
        didSet {
            contactNumberTextField.setPlaceholder(text: "Teléfono")
            contactNumberTextField.delegate = self
        }
    }
    @IBOutlet weak var startLocation: CustomTextField!{
        didSet {
            startLocation.setPlaceholder(text: "Punto de salida")
            startLocation.delegate = self
        }
    }
    @IBOutlet weak var stopsTextField: CustomTextField!{
        didSet {
            stopsTextField.setPlaceholder(text: "Paradas intermedias")
            stopsTextField.delegate = self
        }
    }
    @IBOutlet weak var startDate: DropdownCustomTextField!{
        didSet {
            startDate.setPlaceholder(text: "Fecha de salida")
            startDate.delegate = self
            startDate.dropShadow()
        }
    }
    @IBOutlet weak var startTimeTextField: DropdownCustomTextField!{
        didSet {
            startTimeTextField.setPlaceholder(text: "Hora de salida")
            startTimeTextField.delegate = self
            startTimeTextField.dropShadow()
        }
    }
    @IBOutlet weak var seatsTextField: DropdownCustomTextField!{
        didSet {
            seatsTextField.setPlaceholder(text: "Nº de plazas")
            seatsTextField.delegate = self
            seatsTextField.dropShadow()
        }
    }
    
    @IBOutlet weak var continueButton: UIButton!
    
    init() {
        super.init(nibName: nil, bundle: Bundle.init(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CreateTicketViewController: CreateTicketViewControllerProtocol {
    
}

extension CreateTicketViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case contactNameTextField:
            corporateEmailTextField.becomeFirstResponder()
        case corporateEmailTextField:
            contactNumberTextField.becomeFirstResponder()
        case contactNumberTextField:
            startLocation.becomeFirstResponder()
        case startLocation:
            stopsTextField.becomeFirstResponder()
        case stopsTextField:
            startDate.becomeFirstResponder()
        case startDate:
            startTimeTextField.becomeFirstResponder()
        case startTimeTextField:
            seatsTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            continueButton.sendActions(for: .touchUpInside)
        }
        return false
    }
}
