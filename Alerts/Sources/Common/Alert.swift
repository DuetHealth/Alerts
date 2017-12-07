//
//  Alert.swift
//  Alerts
//
//  Created by Ryan Wachowski on 12/7/17.
//  Copyright © 2017 Duet Health. All rights reserved.
//

import Foundation

public struct Alert {

    public let title: String
    public let message: String
    public let actions: [AlertAction]

    public init(title: String, message: String, actions: AlertAction...) {
        self.title = title
        self.message = message
        self.actions = actions
    }

}
