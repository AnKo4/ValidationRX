//
//  ViewController.swift
//  ValidationRX
//
//  Created by msoft on 10.07.2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ValidationViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var patronymicTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var eMailTextField: UITextField!
    
    @IBOutlet weak var checkBox: CheckBox!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: - Private properties
    
    private var viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
 
    // MARK: - Private methods
    
    private func setupUI() {
        continueButton.isEnabled = false
        continueButton.backgroundColor = UIColor.lightGray

        nameTextField.rx.text.orEmpty.bind(to: viewModel.name).disposed(by: disposeBag)
        surnameTextField.rx.text.orEmpty.bind(to: viewModel.surname).disposed(by: disposeBag)
        patronymicTextField.rx.text.orEmpty.bind(to: viewModel.patronymic).disposed(by: disposeBag)
        phoneNumberTextField.rx.text.orEmpty.bind(to: viewModel.phoneNumber).disposed(by: disposeBag)
        eMailTextField.rx.text.orEmpty.bind(to: viewModel.email).disposed(by: disposeBag)
        
        checkBox.checkBoxChecked.asObservable().bind(to: viewModel.checked).disposed(by: disposeBag)
        
        viewModel.validateTextFields()
            .bind(to: continueButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.validateTextFields()
            .asObservable()
            .map { $0 ? UIColor.blue : UIColor.lightGray }
            .bind(to: continueButton.rx.backgroundColor)
            .disposed(by: disposeBag)
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        self.view.backgroundColor = .green
    }
    
}

