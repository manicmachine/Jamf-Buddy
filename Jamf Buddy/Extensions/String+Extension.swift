//
//  String+Extension.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/27/23.
//

import SwiftUI

// Credit to https://stackoverflow.com/a/56381398/2423089
extension String.StringInterpolation {
    mutating func appendInterpolation(if condition: @autoclosure () -> Bool, _ literal: StringLiteralType) {
            guard condition() else { return }
            appendLiteral(literal)
        }
}
