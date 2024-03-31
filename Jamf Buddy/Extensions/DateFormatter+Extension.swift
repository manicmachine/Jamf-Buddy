//
//  DateFormatter+Extension.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/12/23.
//

import Foundation

extension DateFormatter {
    static let iso8601 = OptionalFractionalSecondsDateFormatter()
}

// Credit to https://stackoverflow.com/a/50281094/2423089
class OptionalFractionalSecondsDateFormatter: DateFormatter {

    static let withoutTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter
    }()
    
    static let withoutSeconds: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"

        return formatter
    }()

    func setup() {
        self.calendar = Calendar(identifier: .iso8601)
        self.locale = Locale(identifier: "en_US_POSIX")
        self.timeZone = TimeZone(identifier: "UTC")
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXX"
    }

    override init() {
        super.init()
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func date(from string: String) -> Date? {
        if let result = super.date(from: string) {
            return result
        } else if let result = OptionalFractionalSecondsDateFormatter.withoutSeconds.date(from: string) {
            return result
        }
        
        return OptionalFractionalSecondsDateFormatter.withoutTime.date(from: string)
    }
}
