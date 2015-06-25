//
//  SNMainViewController.swift
//  Signals
//
//  Created by Leo Tumwattana on 23/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

class SNMainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SNStatusViewControllerDelegate {
    
    // =============
    // MARK: - Enums
    // =============
    
    enum Sections:Int {
        case Sidekicks = 0, OpenSignals, JoinedSignals
    }
    
    // ==================
    // MARK: - Properties
    // ==================
    
    private var _isInitialLayout = true
    @IBOutlet weak var statusViewTopConstraint: NSLayoutConstraint! // -60

    // ================
    // MARK: - Subviews
    // ================
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // =================
    // MARK: - Lifecycle
    // =================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.registerClass(SNSignalsViewControllerCell.self,
            forCellWithReuseIdentifier: "SNSignalsViewControllerCell")
        
        collectionView.registerClass(SNJoinedSignalsViewControllerCell.self,
            forCellWithReuseIdentifier: "SNJoinedSignalsViewControllerCell")
        
        collectionView.registerClass(SNSidekicksViewControllerCell.self,
            forCellWithReuseIdentifier: "SNSidekicksViewControllerCell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if _isInitialLayout {
            
            // Start with OpenSignals
            let indexPath = NSIndexPath(forItem: Sections.OpenSignals.rawValue,
                inSection: 0)
            
            collectionView.scrollToItemAtIndexPath(indexPath,
                atScrollPosition: .CenteredHorizontally,
                animated: false)
            
            _isInitialLayout = false
        }
    }
    
    // ===================
    // MARK: - Preferences
    // ===================
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // =======================
    // MARK: - PrepareForSegue
    // =======================
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? SNStatusViewController {
            vc.delegate = self
        }
    }
    
    // ======================================
    // MARK: - SNStatusViewControllerDelegate
    // ======================================
    
    func statusViewControllerDidChangeState(vc: SNStatusViewController, state: SNStatusViewController.State) {
        
        let constant:CGFloat
        switch state {
        case .Normal:
            constant = -60
        case .Select:
            constant = -190
        }
        
        statusViewTopConstraint.constant = constant
        UIView.animateWithDuration(0.3,
            delay: 0,
            usingSpringWithDamping: 0.75,
            initialSpringVelocity: 0,
            options: .CurveEaseOut,
            animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    // ==================================
    // MARK: - UICollectionViewDataSource
    // ==================================
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch Sections(rawValue: indexPath.row)! {
        case .Sidekicks:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SNSidekicksViewControllerCell",
                forIndexPath: indexPath) as! SNSidekicksViewControllerCell
            return cell
        case .OpenSignals:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SNSignalsViewControllerCell",
                forIndexPath: indexPath) as! SNSignalsViewControllerCell
            return cell
        case .JoinedSignals:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SNJoinedSignalsViewControllerCell",
                forIndexPath: indexPath) as! SNJoinedSignalsViewControllerCell
            return cell
        }
    }
    
    // ==========================================
    // MARK: - UICollectionViewDelegateFlowLayout
    // ==========================================
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    // ================================
    // MARK: - UICollectionViewDelegate
    // ================================
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? SNViewControllerCell {
            cell.addViewControllerToParentViewController(self)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? SNViewControllerCell {
            cell.removeViewControllerFromParentViewController()
        }
    }

}

