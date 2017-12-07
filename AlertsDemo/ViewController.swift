//
//  ViewController.swift
//  AlertsDemo
//
//  Created by Ryan Wachowski on 12/7/17.
//  Copyright © 2017 Duet Health. All rights reserved.
//

import Alerts
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let alert = Alert(title: "Hooray!", message: "I'm in your face!", actions: .destructive(title: "DESTROY") {
            let innerAlert = Alert(title: "Rest in Pieces", message: "☠️", actions: .default(title: "You're winner!"), .cancel)
            self.present(innerAlert.asController(style: .actionSheet), animated: true)
        })

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: UInt64(Double(NSEC_PER_SEC) * 1.5)), execute: {
            self.present(alert.asController(style: .alert), animated: true)
        })

    }

}

