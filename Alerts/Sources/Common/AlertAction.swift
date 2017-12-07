//
//  AlertAction.swift
//  Alerts
//
//  Created by Ryan Wachowski on 12/7/17.
//  Copyright © 2017 Duet Health. All rights reserved.
//

import Foundation

/// An `AlertAction` is an abstraction of modal context behaviors.
///
/// This structure is designed to play nicely with native modal actions (i.e. `UIAlertAction`) and
/// support flexibility of consumption.
public struct AlertAction {

    /// Initializes an action with intent to cancel, circumvent, or otherwise disregard the functional
    /// result of confirmation.
    ///
    /// - Parameters:
    ///   - title: the name of the action
    ///   - action: the behavior executed by the action
    public static func cancel(title: String, _ action: (() -> ())? = nil) -> AlertAction {
        return AlertAction(title: title, appearance: .cancel, action)
    }

    /// Intializes an action with ambiguous intent.
    ///
    /// - Parameters:
    ///   - title: the title of the action
    ///   - action: the behavior performed by the action
    public static func `default`(title: String, _ action: (() -> ())? = nil) -> AlertAction {
        return AlertAction(title: title, action)
    }

    /// Intializes an action with intent to perform an irreversible (and potentially undesirable)
    /// functional result.
    ///
    /// - Parameters:
    ///   - title: the title of the action
    ///   - action: the behavior performed by the action
    public static func destructive(title: String, action: (() -> ())? = nil) -> AlertAction {
        return AlertAction(title: title, appearance: .destructive, action)
    }

    /// Returns the title of the action.
    public let title: String

    /// Returns the behavior which is performed by the action.
    public let action: (() -> ())?

    /// Returns the appearance of the action.
    public let appearance: ActionAppearance

    fileprivate init(title: String, appearance: ActionAppearance = .default, _ action: (() -> ())?) {
        self.title = title
        self.action = action
        self.appearance = appearance
    }

}

public enum ActionAppearance {
    case cancel
    case `default`
    case destructive
}
