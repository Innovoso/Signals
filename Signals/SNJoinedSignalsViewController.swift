//
//  SNJoinedSignalsViewController.swift
//  Signals
//
//  Created by Leo Tumwattana on 24/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

class SNJoinedSignalsViewController: SNNoHairlineNavigationBarViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // ================
    // MARK: - Subviews
    // ================
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // =================
    // MARK: - Lifecycle
    // =================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStarryBackground()
        
        collectionView.contentInset.top = 64
        collectionView.contentInset.bottom = 100
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(UINib(nibName: "SNJoinedSignalCell", bundle: nil),
            forCellWithReuseIdentifier: "SNJoinedSignalCell")
        
    }
    
    // ==================================
    // MARK: - UICollectionViewDataSource
    // ==================================
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SNJoinedSignalCell",
            forIndexPath: indexPath) as! SNJoinedSignalCell
        return cell
    }
    
    // ==========================================
    // MARK: - UICollectionViewDelegateFlowLayout
    // ==========================================
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(collectionView.bounds.width, 100)
    }
    
    // ================================
    // MARK: - UICollectionViewDelegate
    // ================================
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "SignalDetail", bundle: nil)
        if let vc = storyboard.instantiateViewControllerWithIdentifier("SNSignalDetailViewController") as? SNSignalDetailViewController {
            presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    // ===============
    // MARK: - Helpers
    // ===============
    
    private func setupStarryBackground() {
        // Starry background
        let backgroundView = NSBundle.mainBundle().loadNibNamed("SNStarBackgroundView",
            owner: self,
            options: nil).first as! SNStarBackgroundView
        collectionView.backgroundView = backgroundView
        
        // Transparent navigation bar
        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.translucent = true
    }

}
