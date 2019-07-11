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
    
    var name = BehaviorRelay<String>(value: "")
    var surname = BehaviorRelay<String>(value: "")
    var phoneNumber = BehaviorRelay<String>(value: "")
    
    func validateTextFields(/*name: Observable<String>, surname: Observable<String>, phoneNumber: Observable<String>*/) -> Observable<Bool> {
        print("func!")
        let validation = Observable.combineLatest(self.name.asObservable(), self.surname.asObservable(), self.phoneNumber.asObservable())   { (n,s,p) in
          return n.count > 0 && s.count > 0 && p.count > 0
        }
        return validation
    }
}
