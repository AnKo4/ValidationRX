//
//  Extensions.swift
//  ValidationRX
//
//  Created by msoft on 15.07.2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import Foundation

extension String {
    func isValid(validationPattern: RegExps) -> Bool {
        // here, 'try!' will always succeed because the pattern is valid
        let regEx = try! NSRegularExpression(pattern: validationPattern.rawValue, options: .caseInsensitive)
        return regEx.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.count)) != nil
    }
}
