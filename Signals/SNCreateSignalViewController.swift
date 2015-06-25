//
//  SNCreateSignalViewController.swift
//  Signals
//
//  Created by Leo Tumwattana on 25/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

class SNCreateSignalViewController: SNNoHairlineNavigationBarViewController {

    @IBAction func closeButtonTapped(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func createButtonTapped(sender: UIButton) {
        println("Should create signal")
    }
}
