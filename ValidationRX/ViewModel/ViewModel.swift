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
    
    // MARK: - Public methods
    
    func validateTextFields() -> Observable<Bool> {
        let validation = Observable.combineLatest(self.name.asObservable(), self.surname.asObservable(), self.phoneNumber.asObservable(), self.checked.asObservable()) { (n,s,p,c) in
            return n.count > 0 && s.count > 0 && p.count > 0 && c
        }
        return validation
    }
}
