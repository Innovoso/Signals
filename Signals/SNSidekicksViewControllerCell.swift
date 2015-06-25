//
//  SNSidekicksViewControllerCell.swift
//  Signals
//
//  Created by Leo Tumwattana on 24/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

class SNSidekicksViewControllerCell: SNViewControllerCell {
    
    override func createViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Sidekicks", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("SNSidekicksViewController")
            as! SNSidekicksViewController
        return vc
    }
 
}
