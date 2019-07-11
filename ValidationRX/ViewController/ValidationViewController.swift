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
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var patronymicTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var eMailTextField: UITextField!
    
    @IBOutlet weak var checkBox: CheckBox!
    @IBOutlet weak var continueButton: UIButton!
    

    
    var viewModel = ViewModel()
 
    let disposeBag = DisposeBag()
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        self.view.backgroundColor = .green
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
 
    
    func setupUI() {
        
        continueButton.isEnabled = false
        continueButton.backgroundColor = UIColor.lightGray

        nameTextField.rx.text.orEmpty.bind(to: viewModel.name).disposed(by: disposeBag)
        surnameTextField.rx.text.orEmpty.bind(to: viewModel.surname).disposed(by: disposeBag)
        phoneNumberTextField.rx.text.orEmpty.bind(to: viewModel.phoneNumber).disposed(by: disposeBag)
        
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
}

