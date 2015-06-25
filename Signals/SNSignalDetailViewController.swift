//
//  SNSignalDetailViewController.swift
//  Signals
//
//  Created by Leo Tumwattana on 25/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

class SNSignalDetailViewController: SNNoHairlineNavigationBarViewController {

    // ===================
    // MARK: - Preferences
    // ===================
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // ======================
    // MARK: - Event handlers
    // ======================
    
    @IBAction func closeButtonTapped(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
