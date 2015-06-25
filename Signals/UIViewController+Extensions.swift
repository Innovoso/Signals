//
//  UIViewController+Extensions.swift
//  Signals
//
//  Created by Leo Tumwattana on 24/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideHairlineView(navigationBar:UINavigationBar) {
        if let hairlineView = findHairlineImageViewUnder(navigationBar) {
            hairlineView.hidden = true
        }
    }
    
    private func findHairlineImageViewUnder(view:UIView) -> UIImageView? {
        if let view = view as? UIImageView where view.bounds.size.height <= 1 {
            return view
        }
        
        for subview in view.subviews {
            if let view = subview as? UIView,
                let imageView = self.findHairlineImageViewUnder(view)
            {
                return imageView
            }
        }
        return nil
    }
}
    