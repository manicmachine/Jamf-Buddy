//
//  Date+Extension.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/21/23.
//

import Foundation

extension Date {
    func getRelativeAndCompleteString() -> String {
        return "\(self.formatted(.relative(presentation: .numeric))) (\(self.formatted()))"
    }
}
