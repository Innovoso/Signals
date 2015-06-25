//
//  SNViewControllerCell.swift
//  Signals
//
//  Created by Leo Tumwattana on 24/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

class SNViewControllerCell: UICollectionViewCell {
    // ==================
    // MARK: - Properties
    // ==================
    
    lazy var viewController:UIViewController = self.createViewController()
    
    // ==============
    // MARK: - Layout
    // ==============
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewController.view.frame = bounds
    }
    
    // ===================================
    // MARK: - View Controller Containment
    // ===================================
    
    func addViewControllerToParentViewController(parentViewController:UIViewController) {
        parentViewController.addChildViewController(viewController)
        viewController.didMoveToParentViewController(parentViewController)
        viewController.view.frame = contentView.bounds
        contentView.addSubview(viewController.view)
    }
    
    func removeViewControllerFromParentViewController() {
        viewController.view.removeFromSuperview()
        viewController.willMoveToParentViewController(nil)
        viewController.removeFromParentViewController()
    }
    
    func createViewController() -> UIViewController {
        return UIViewController()
    }
}
