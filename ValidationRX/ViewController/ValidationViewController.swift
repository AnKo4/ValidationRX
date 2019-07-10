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

    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        self.view.backgroundColor = .lightGray
        print("tapped")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }

    func setupUI() {
        
        let disposeBag = DisposeBag()
        
        continueButton.isEnabled = false
        continueButton.backgroundColor = UIColor.lightGray
        
        let name = nameTextField.rx.text.orEmpty.asObservable()
        let surname = surnameTextField.rx.text.orEmpty.asObservable()
        let phoneNumber = phoneNumberTextField.rx.text.orEmpty.asObservable()
 //       let checked = checkBox.rx.checkBoxTapped.asObservable
        
        viewModel.validateTextFields(name: name, surname: surname, phoneNumber: phoneNumber)
            .bind(to: continueButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}

