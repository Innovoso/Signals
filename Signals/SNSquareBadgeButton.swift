//
//  SNSquareBadgeButton.swift
//  Signals
//
//  Created by Leo Tumwattana on 25/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit
import pop

@IBDesignable class SNSquareBadgeButton: SNExpandedButton {

    // ==================
    // MARK: - Properties
    // ==================
    
    @IBInspectable var height:CGFloat = 25
    @IBInspectable var minWidth:CGFloat = 25
    @IBInspectable var padding:CGFloat = 12
    
    @IBInspectable var borderWidth:CGFloat = 2 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var highlightColor:UIColor = UIColor.whiteColor() {
        didSet {
            updateCount(self.count)
        }
    }
    
    @IBInspectable var highlightBorderColor:UIColor = UIColor.whiteColor() {
        didSet {
            updateCount(self.count)
        }
    }
    
    
    @IBInspectable var emptyColor:UIColor = UIColor.whiteColor() {
        didSet {
            updateCount(self.count)
        }
    }
    
    @IBInspectable var count:Int = 0 {
        didSet {
            updateCount(count)
        }
    }
    
    // ============
    // MARK: - Init
    // ============
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = emptyColor.CGColor
    }
    
    // ==============
    // MARK: - Sizing
    // ==============
    
    override func sizeThatFits(size: CGSize) -> CGSize {
        let size = super.sizeThatFits(size)
        var width = count <= 99 ? minWidth : max(size.width + padding, minWidth)
        return CGSizeMake(width, height)
    }
    
    // ===============
    // MARK: - Helpers
    // ===============
    
    private func updateCount(count:Int) {
        
        var borderColor = highlightBorderColor
        var bgColor = highlightColor
        
        if count > 99
        {
            setTitle("99+", forState: .Normal)
        }
        else if count <= 0
        {
            setTitle(nil, forState: .Normal)
            borderColor = emptyColor
            bgColor = UIColor.clearColor()
        }
        else
        {
            setTitle("\(count)", forState: .Normal)
        }
        
        UIView.animateWithDuration(0.25,
            delay: 0.0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 0.0,
            options: UIViewAnimationOptions.BeginFromCurrentState,
            animations: {
                self.sizeToFit()
                self.backgroundColor = bgColor
                self.layer.borderColor = borderColor.CGColor
            }, completion: nil)
    }
    
    func animateButton() {
        var rotateAnimation:CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = 1.0
        rotateAnimation.duration = 0.6
        self.layer.addAnimation(rotateAnimation, forKey:nil)
    }
}
