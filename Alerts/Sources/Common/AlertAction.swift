//
//  AlertAction.swift
//  Alerts
//
//  Created by Ryan Wachowski on 12/7/17.
//  Copyright © 2017 Duet Health. All rights reserved.
//

import Foundation

public struct AlertAction {

    public static func cancel(title: String, _ action: (() -> ())? = nil) -> AlertAction {
        return AlertAction(title: title, appearance: .cancel, action)
    }

    public static func `default`(title: String, _ action: (() -> ())? = nil) -> AlertAction {
        return AlertAction(title: title, action)
    }

    public static func destructive(title: String, action: (() -> ())? = nil) -> AlertAction {
        return AlertAction(title: title, appearance: .destructive, action)
    }

    public let title: String
    public let action: (() -> ())?
    internal let appearance: ActionAppearance

    fileprivate init(title: String, appearance: ActionAppearance = .default, _ action: (() -> ())?) {
        self.title = title
        self.action = action
        self.appearance = appearance
    }

}

internal enum ActionAppearance {
    case cancel
    case `default`
    case destructive
}
