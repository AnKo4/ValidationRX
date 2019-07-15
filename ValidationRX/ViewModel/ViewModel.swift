//
//  ViewModel.swift
//  ValidationRX
//
//  Created by msoft on 10.07.2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ViewModel {
    
    // MARK: - Public properties
    
    var name = BehaviorRelay<String>(value: "")
    var surname = BehaviorRelay<String>(value: "")
    var phoneNumber = BehaviorRelay<String>(value: "")
    var checked = BehaviorRelay<Bool>(value: false)
    
    let validator = Validator()
    
    // MARK: - Public methods
    
    func validateTextFields() -> Observable<Bool> {
        let validation = Observable.combineLatest(self.name.asObservable(), self.surname.asObservable(), self.phoneNumber.asObservable(), self.checked.asObservable()) { (name,surname,phoneNumber,checked) in
 /*           return  self.validator.isValid(textToValidate: name, validationPattern: .name) &&
                    self.validator.isValid(textToValidate: surname, validationPattern: .name) &&
                    self.validator.isValid(textToValidate: phoneNumber, validationPattern: .phoneNumber) &&
                    checked   */
            return name.isValid(validationPattern: .name) && surname.isValid(validationPattern: .name) && phoneNumber.isValid(validationPattern: .phoneNumber) && checked
        }
        return validation
    }
}
