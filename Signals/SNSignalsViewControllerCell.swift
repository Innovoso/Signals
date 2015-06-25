//
//  SNSignalsViewControllerCell.swift
//  Signals
//
//  Created by Leo Tumwattana on 24/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

class SNSignalsViewControllerCell: SNViewControllerCell {
    
    override func createViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Signals", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("SNSignalsViewController")
            as! SNSignalsViewController
        return vc
    }
 
}
