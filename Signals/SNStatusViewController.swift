//
//  SNStatusViewController.swift
//  Signals
//
//  Created by Leo Tumwattana on 24/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

@objc protocol SNStatusViewControllerDelegate {
    optional func statusViewControllerDidChangeState(vc:SNStatusViewController, state:SNStatusViewController.State)
}

class SNStatusViewController: UIViewController {
    
    // =============
    // MARK: - Enums
    // =============
    
    @objc enum State:Int {
        case Normal = 0, Select
    }
    
    // ==================
    // MARK: - Properties
    // ==================
    
    weak var delegate:SNStatusViewControllerDelegate?
    
    var state:State = .Normal {
        didSet {
            if state != oldValue {
                displayForState(state)
                delegate?.statusViewControllerDidChangeState?(self, state: state)
            }
        }
    }

    // ================
    // MARK: - Subviews
    // ================
    
    @IBOutlet weak var currentStatusButton: SNStatusButton!
    @IBOutlet weak var currentStatusView: UIView!
    @IBOutlet weak var selectStatusView: UIView!
    
    // =================
    // MARK: - Lifecycle
    // =================
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // ======================
    // MARK: - Event handlers
    // ======================
    
    @IBAction func currentStatusButtonTapped(sender: UIButton) {
        state = .Select
    }
    
    @IBAction func buttonATapped(sender: UIButton) {
        state = .Normal
    }
    
    @IBAction func buttonBTapped(sender: UIButton) {
        state = .Normal
    }
    
    @IBAction func buttonCTapped(sender: UIButton) {
        state = .Normal
    }
    
    @IBAction func createButtonTapped(sender: UIButton) {
        let storyboard = UIStoryboard(name: "CreateSignal", bundle: nil)
        if let vc = storyboard.instantiateViewControllerWithIdentifier("SNCreateSignalViewController") as? SNCreateSignalViewController {
            presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    // ===============
    // MARK: - Helpers
    // ===============
    
    private func displayForState(state:State) {
        switch state {
        case .Normal:
            currentStatusView.hide(false)
            selectStatusView.hide(true)
        case .Select:
            currentStatusView.hide(true)
            selectStatusView.hide(false)
        }
    }

}
