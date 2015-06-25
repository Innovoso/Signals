//
//  UIView+Extensions.swift
//  Signals
//
//  Created by Leo Tumwattana on 25/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

extension UIView {
    
    func hide(hide:Bool) {
        let targetAlpha:CGFloat
        
        if hide {
            targetAlpha = 0
        } else {
            hidden = false
            alpha = 0
            targetAlpha = 1
        }
        
        UIView.animateWithDuration(0.2,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: .CurveEaseInOut,
            animations: {
                self.alpha = targetAlpha
            }, completion: { finished in
                self.hidden = hide
        })
    }
    
    @IBInspectable var cornerRadius:CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
}
