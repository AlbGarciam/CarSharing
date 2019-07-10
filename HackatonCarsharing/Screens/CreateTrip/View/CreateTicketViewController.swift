//
//  CreateTicketViewController.swift
//  HackatonCarsharing
//
//  Created by Alberto Garcia-Muñoz on 09/07/2019.
//  Copyright © 2019 pruebas. All rights reserved.
//

import UIKit

protocol CreateTicketViewControllerProtocol : AnyObject {
    var origin: String? { get }
    var contactName: String? { get }
    var contactNumber: String? { get }
    var email: String? { get }
    var totalSeats: String? { get }
    var startTime: Date? { get }
    var startDate: Date? { get }
    var stops: String? { get }
    var isContinueEnabled: Bool { get set }
    
    func navigateToConfirmation()
    func navigateToError()
    func isLoading(_ loading: Bool)
}

class CreateTicketViewController: UIViewController {
    static let datePickerHeight: CGFloat = 216.0
    
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
            contactNameTextField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var corporateEmailTextField: CustomTextField!{
        didSet {
            corporateEmailTextField.setPlaceholder(text: "Email corporativo")
            corporateEmailTextField.delegate = self
            corporateEmailTextField.keyboardType = .emailAddress
            corporateEmailTextField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var contactNumberTextField: CustomTextField!{
        didSet {
            contactNumberTextField.setPlaceholder(text: "Teléfono")
            contactNumberTextField.delegate = self
            contactNumberTextField.keyboardType = .phonePad
            contactNumberTextField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var startLocation: CustomTextField!{
        didSet {
            startLocation.setPlaceholder(text: "Especifica el punto de salida")
            startLocation.delegate = self
            startLocation.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var stopsTextField: CustomTextField!{
        didSet {
            stopsTextField.setPlaceholder(text: "Especifica las paradas intermedias")
            stopsTextField.delegate = self
            stopsTextField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var startDateTextField: DropdownCustomTextField!{
        didSet {
            startDateTextField.setPlaceholder(text: "Fecha de salida")
            startDateTextField.delegate = self
            startDateTextField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var startTimeTextField: DropdownCustomTextField!{
        didSet {
            startTimeTextField.setPlaceholder(text: "Hora de salida")
            startTimeTextField.delegate = self
            startTimeTextField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var seatsTextField: CustomTextField! {
        didSet {
            seatsTextField.setPlaceholder(text: "Nº de plazas")
            seatsTextField.keyboardType = .numberPad
            seatsTextField.delegate = self
            seatsTextField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var continueButton: UIButton! {
        didSet {
            continueButton.setTitle("Publicar viaje", for: .normal)
            continueButton.addTarget(self, action: #selector(continueButtonTapped(_:)), for: .touchUpInside)
        }
    }
    let picker = UIDatePicker()
    
    private var startDateValue: Date?
    private var startHourValue: Date?
    
    init() {
        super.init(nibName: nil, bundle: Bundle.init(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    func showHourPicker() {
        //Formate Date
        picker.datePickerMode = .time
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneHourPicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        startTimeTextField.inputAccessoryView = toolbar
        startTimeTextField.inputView = picker
    }
    
    func showDatePicker(){
        //Formate Date
        picker.datePickerMode = .date
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        startDateTextField.inputAccessoryView = toolbar
        startDateTextField.inputView = picker
    }
    
    @objc func doneDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        startDateValue = picker.date
        startDateTextField.text = formatter.string(from: picker.date)
        self.view.endEditing(true)
    }
    
    @objc func doneHourPicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        startHourValue = picker.date
        startTimeTextField.text = formatter.string(from: picker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @objc private func textFieldDidChanged(_ sender: UITextField) {
        presenter.inputValuesUpdated()
    }
    
    @objc private func continueButtonTapped(_ sender: UIButton) {
        presenter.continueRequested()
	}
    
    private var loader: SpinnerView?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Compartir mi coche"
    }
}

extension CreateTicketViewController: CreateTicketViewControllerProtocol {
    func isLoading(_ loading: Bool) {
        loading ? showLoading() : hideLoading()
    }
    
    func navigateToConfirmation() {
        let overlay = assembler.provideConfirmation(confirmationType: .driver)
        present(overlay, animated: true, completion: nil)
    }
    
    func navigateToError() {
        let overlay = assembler.provideConfirmation(confirmationType: .error)
        present(overlay, animated: true, completion: nil)
    }
    
    var contactName: String? { return contactNameTextField.text }
    
    var contactNumber: String? { return contactNumberTextField.text }
    
    var email: String? { return corporateEmailTextField.text }
    
    var totalSeats: String? { return seatsTextField.text }
    
    var startTime: Date? { return startHourValue }
    
    var startDate: Date? { return startDateValue }
    
    var stops: String? { return stopsTextField.text}
    
    var origin: String? { return startLocation.text }
    
    var isContinueEnabled: Bool {
        set { continueButton.isEnabled = newValue }
        get { return continueButton.isEnabled }
    }
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
            startDateTextField.becomeFirstResponder()
        case startDateTextField:
            startTimeTextField.becomeFirstResponder()
        case startTimeTextField:
            seatsTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            continueButton.sendActions(for: .touchUpInside)
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case startDateTextField:
            showDatePicker()
        case startTimeTextField:
            showHourPicker()
        default:
            break
        }
    }
}
