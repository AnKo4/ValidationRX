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
    var patronymic = BehaviorRelay<String>(value: "")
    var phoneNumber = BehaviorRelay<String>(value: "")
    var email = BehaviorRelay<String>(value: "")
    var checked = BehaviorRelay<Bool>(value: false)
    
    // MARK: - Public methods
    
    func validateTextFields() -> Observable<Bool> {
        let validation = Observable.combineLatest(self.name.asObservable(), self.surname.asObservable(), self.patronymic.asObservable(), self.phoneNumber.asObservable(), self.email.asObservable(), self.checked.asObservable()) {
            (name: String, surname: String, patronymic: String, phoneNumber: String, email: String, checked: Bool) -> Bool in
           
            let patronymicIsValid = (patronymic.count != 0) ? patronymic.isValid(validationPattern: .name) : true
            let emailIsValid = (email.count != 0) ? email.isValid(validationPattern: .email) : true
            
            return name.isValid(validationPattern: .name) && surname.isValid(validationPattern: .name) && patronymicIsValid && phoneNumber.isValid(validationPattern: .phoneNumber) && emailIsValid && checked
        }
        return validation
    }
}
