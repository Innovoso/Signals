//
//  SNSignalsViewController.swift
//  Signals
//
//  Created by Leo Tumwattana on 24/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

class SNSignalsViewController: SNNoHairlineNavigationBarViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset.top = 64
        collectionView.contentInset.bottom = 100
        collectionView.alwaysBounceVertical = true
        
        collectionView.registerNib(UINib(nibName: "SNSignalCell", bundle: nil),
            forCellWithReuseIdentifier: "SNSignalCell")
    }
    
    // ==================================
    // MARK: - UICollectionViewDataSource
    // ==================================
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SNSignalCell",
            forIndexPath: indexPath) as! SNSignalCell
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
