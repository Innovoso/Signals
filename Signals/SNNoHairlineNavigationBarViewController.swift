//
//  SNNoHairlineNavigationBarViewController.swift
//  Signals
//
//  Created by Leo Tumwattana on 24/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

class SNNoHairlineNavigationBarViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        hideHairlineView(navigationBar)
    }

}
