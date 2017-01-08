//
//  RGInnerBadgeButton.swift
//  RGInnerBadgeButton
//
//  Created by Masher Shin on 03/01/2017.
//  Copyright © 2017 Masher Shin. All rights reserved.
//

import UIKit

@IBDesignable
class RGInnerBadgeButton: UIButton {
    
    @IBInspectable
    var margin: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var countDiffSize: CGFloat = 4 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var countInsetTop: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var countInsetLeft: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var countInsetBottom: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var countInsetRight: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var lineWidth: CGFloat = 1 / UIScreen.main.nativeScale {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var badgeNumber: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var countEdgeInsets: UIEdgeInsets {
        return UIEdgeInsets(top: countInsetTop, left: countInsetLeft, bottom: countInsetBottom, right: countInsetRight)
    }
    
    override func draw(_ rect: CGRect) {
        if let titleLabel = titleLabel {
            let countFont = UIFont(name: titleLabel.font.fontName,
                                   size: titleLabel.font.pointSize - countDiffSize)!
            
            var countStringAttributes: [String: Any] = [:]
            countStringAttributes[NSFontAttributeName] = countFont
            if let textColor = titleLabel.textColor {
                countStringAttributes[NSForegroundColorAttributeName] = textColor
            } else {
                countStringAttributes[NSForegroundColorAttributeName] = UIColor.clear
            }
            let countString = NSAttributedString(string: String(badgeNumber), attributes: countStringAttributes)
            let badgeSize = CGSize(width: countString.size().width + countEdgeInsets.left + countEdgeInsets.right,
                                   height: countString.size().height + countEdgeInsets.top + countEdgeInsets.bottom)
            
            let inset = (badgeSize.width + margin) / 2
            titleEdgeInsets = UIEdgeInsetsMake(0, -inset, 0, inset)
            
            let countPoint = CGPoint(x: titleLabel.frame.maxX + margin + countEdgeInsets.left - inset,
                                     y: titleLabel.frame.midY - (countString.size().height / 2))
            
            countString.draw(at: countPoint)
            
            let badgeRect = CGRect(x: countPoint.x - countEdgeInsets.left,
                                   y: countPoint.y - countEdgeInsets.top,
                                   width: badgeSize.width,
                                   height: badgeSize.height)
            
            let badgePath = UIBezierPath(rect: badgeRect)
            badgePath.lineWidth = lineWidth
            titleLabel.textColor.set()
            badgePath.stroke()
        }
    }
}
