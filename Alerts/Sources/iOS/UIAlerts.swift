//
//  UIAlerts.swift
//  Alerts
//
//  Created by Ryan Wachowski on 12/7/17.
//  Copyright © 2017 Duet Health. All rights reserved.
//

import Foundation
import UIKit

extension ActionAppearance {

    var alertStyle: UIAlertActionStyle {
        switch self {
        case .cancel: return .cancel
        case .destructive: return .destructive
        default: return .default
        }
    }

}

extension Alert {

    public func asController(style: UIAlertControllerStyle) -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { action in
            controller.addAction(UIAlertAction(title: action.title, style: action.appearance.alertStyle) { _ in
                action.action?()
            })
        }
        return controller
    }

}
