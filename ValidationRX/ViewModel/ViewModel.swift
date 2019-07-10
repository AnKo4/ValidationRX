//
//  ViewModel.swift
//  ValidationRX
//
//  Created by msoft on 10.07.2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import Foundation
import RxSwift

struct ViewModel {
    func validateTextFields(name: Observable<String>, surname: Observable<String>, phoneNumber: Observable<String>) -> Observable<Bool> {
        let validation = Observable.combineLatest(name, surname, phoneNumber)   {
            (name, surname, phoneNumber) in
            return name.count > 0 && surname.count > 0 && phoneNumber.count > 0
        }
        print(validation)
        return validation
    }
}
