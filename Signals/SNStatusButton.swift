//
//  SNStatusButton.swift
//  Signals
//
//  Created by Leo Tumwattana on 24/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

@IBDesignable class SNStatusButton: UIButton {
    
    // ==================
    // MARK: - Properties
    // ==================
    
    @IBInspectable var dotColor:UIColor? {
        didSet {
            dotLayer?.backgroundColor = dotColor?.CGColor
            circleLayer?.borderColor = dotColor?.CGColor
        }
    }
    
    @IBInspectable var emptyDot:Bool = false {
        didSet {
            dotLayer?.hidden = emptyDot
        }
    }
    
    // ================
    // MARK: - Subviews
    // ================
    
    var dotLayer:CALayer!
    var circleLayer:CALayer!
    
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
        circleLayer = CALayer()
        circleLayer.frame = CGRectMake(0, 0, 16, 16)
        circleLayer.cornerRadius = 8
        circleLayer.borderWidth = 1
        layer.addSublayer(circleLayer)
        
        dotLayer = CALayer()
        dotLayer.frame = CGRectMake(0, 0, 10, 10)
        dotLayer.cornerRadius = 5
        layer.addSublayer(dotLayer)
        
        titleEdgeInsets.right = -20
    }
    
    // ==========
    // MARK: - IB
    // ==========
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        titleEdgeInsets.right = -20
    }
    
    override func intrinsicContentSize() -> CGSize {
        let size = super.intrinsicContentSize()
        return CGSizeMake(size.width + 30, size.height)
    }

    // ==============
    // MARK: - Layout
    // ==============
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dotLayer.position = CGPointMake(8, bounds.height / 2 + 1)
        circleLayer.position = CGPointMake(8, bounds.height / 2 + 1)
    }

}
