//
//  SNExpandedButton.swift
//  Signals
//
//  Created by Leo Tumwattana on 25/6/15.
//  Copyright (c) 2015 Innovoso Limited. All rights reserved.
//

import UIKit

class SNExpandedButton: UIButton {
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        return CGRectContainsPoint(self.expandedBounds(), point) ? self : nil
    }
    
    func expandedBounds() -> CGRect {
        return CGRectInset(self.bounds, -20, -20)
    }
}
