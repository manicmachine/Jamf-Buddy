//
//  EnvironmenValues+Extension.swift
//  Jamf Buddy
//
//  Created by Oliphant, Corey Dean on 12/20/23.
//

import SwiftUI

extension EnvironmentValues {

    var isPreview: Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }

}
