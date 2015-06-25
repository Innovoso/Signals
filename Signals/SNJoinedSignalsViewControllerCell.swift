//
//  SNJoinedSignalsViewControllerCell.swift
//  Signals
//
//  Created by Leo Tumwattana on 24/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

class SNJoinedSignalsViewControllerCell: SNViewControllerCell {
    
    override func createViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "JoinedSignals", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("SNJoinedSignalsViewController")
            as! SNJoinedSignalsViewController
        return vc
    }
    
}
