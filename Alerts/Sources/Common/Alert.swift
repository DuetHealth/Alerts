//
//  Alert.swift
//  Alerts
//
//  Created by Ryan Wachowski on 12/7/17.
//  Copyright © 2017 Duet Health. All rights reserved.
//

import Foundation

/// An `Alert` is an abstraction of modal contexts.
///
/// This structure is designed to play nicely with native modals (i.e. `UIAlertController`) and
/// support flexibility of consumption.
public struct Alert {

    /// Returns the primary title of the alert.
    public let title: String?

    /// Returns the supplementary message of the alert.
    public let message: String?

    /// Returns the list of executable actions belonging to the alert.
    public let actions: [AlertAction]

    /// Initializes a new alert.
    ///
    /// - Parameters:
    ///   - title: the primary title of the alert
    ///   - message: an optional supplementary message
    ///   - actions: the list of executable actions belonging to the alert
    public init(title: String? = nil, message: String? = nil, actions: AlertAction...) {
        self.title = title
        self.message = message
        self.actions = actions
    }

}
