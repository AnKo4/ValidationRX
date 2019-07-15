//
//  Validator.swift
//  ValidationRX
//
//  Created by msoft on 15.07.2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import Foundation

class Validator {
    func isValid(textToValidate: String, validationPattern: RegExps) -> Bool {
        // here, 'try!' will always succeed because the pattern is valid
        let regEx = try! NSRegularExpression(pattern: validationPattern.rawValue, options: .caseInsensitive)
        return regEx.firstMatch(in: textToValidate, options: [], range: NSRange(location: 0, length: textToValidate.count)) != nil
    }
}
