//
//  SNJoinedSignalCell.swift
//  Signals
//
//  Created by Leo Tumwattana on 25/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

@IBDesignable class SNJoinedSignalCell: UICollectionViewCell {
    
    // ================
    // MARK: - Subviews
    // ================
    
    var lightLayer:CAShapeLayer!
    
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
        lightLayer = CAShapeLayer()
        lightLayer.fillColor = UIColor.whiteColor().colorWithAlphaComponent(0.5).CGColor
        layer.addSublayer(lightLayer)
        
        backgroundColor = UIColor.clearColor()
    }
    
    // ==============
    // MARK: - Layout
    // ==============
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lightLayer.path = lightConePath(bounds: bounds).CGPath
    }
    
    // ==============
    // MARK: - Helper
    // ==============
    
    private func lightConePath(#bounds:CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, bounds.height / 10 * 6))
        path.addLineToPoint(CGPointMake(bounds.width / 2 - 6, 0))
        path.addLineToPoint(CGPointMake(bounds.width / 2, 80))
        path.addLineToPoint(CGPointMake(0, bounds.height / 10 * 9.5))
        path.closePath()
        return path
    }
}
