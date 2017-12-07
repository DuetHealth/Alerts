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

    /// Represents the functional result of an action.
    public enum Behavior {

        /// Performs the "functional opposite" of a confirmation action, i.e. disregarding or circumventing the alert.
        case cancel

        /// Performs an ambiguous behavior.
        case `default`

        /// Performs an irreversible (and potentially undesirable) action.
        case destructive

    }

    /// Initializes an action with intent to cancel, circumvent, or otherwise disregard the functional
    /// result of confirmation.
    ///
    /// - Parameters:
    ///   - title: the name of the action
    ///   - action: the behavior executed by the action
    public static func cancel(title: String, _ action: (() -> ())? = nil) -> AlertAction {
        return AlertAction(title: title, behavior: .cancel, action)
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
        return AlertAction(title: title, behavior: .destructive, action)
    }

    /// Returns the title of the action.
    public let title: String

    /// Returns the behavior which is performed by the action.
    public let action: (() -> ())?

    /// Returns the behavior of the action.
    public let behavior: Behavior

    fileprivate init(title: String, behavior: Behavior = .default, _ action: (() -> ())?) {
        self.title = title
        self.action = action
        self.behavior = behavior
    }

}
