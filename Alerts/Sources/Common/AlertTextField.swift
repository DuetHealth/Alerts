//
//  AlertTextField.swift
//  Alerts
//
//  Created by Ryan Wachowski on 8/2/18.
//  Copyright © 2018 Duet Health. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

public struct AlertTextField {

    public let placeholder: String
    public let initialValue: String

#if canImport(UIKit)

    public var keyboardType = UIKeyboardType.default
    public var autocorrection = UITextAutocorrectionType.default

#endif

    public init(placeholder: String = "", initialValue: String = "") {
        self.placeholder = placeholder
        self.initialValue = initialValue
    }

}
