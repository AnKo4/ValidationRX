//
//  RegExps.swift
//  ValidationRX
//
//  Created by msoft on 15.07.2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import Foundation

enum RegExps: String {
    case name = "^[A-Za-z]{2,}$"
    case phoneNumber = "^((\\+7[0-9]{10})|(8[0-9]{10}))$"
    case email = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
}
