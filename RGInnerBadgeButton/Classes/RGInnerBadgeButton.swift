//
//  RGInnerBadgeButton.swift
//  RGInnerBadgeButton
//
//  Created by Masher Shin on 03/01/2017.
//  Copyright © 2017 Masher Shin. All rights reserved.
//

import UIKit

@IBDesignable
@objc open class RGInnerBadgeButton: UIButton {
    
    @IBInspectable
    open var margin: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var countDiffSize: CGFloat = 4 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var countInsetTop: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var countInsetLeft: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var countInsetBottom: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var countInsetRight: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var lineWidth: CGFloat = 1 / UIScreen.main.nativeScale {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var badgeNumber: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var countEdgeInsets: UIEdgeInsets {
        return UIEdgeInsets(top: countInsetTop, left: countInsetLeft, bottom: countInsetBottom, right: countInsetRight)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        setNeedsDisplay()
    }
    
    override open func draw(_ rect: CGRect) {
        guard let titleLabel = titleLabel else {
            return
        }
        if badgeNumber == 0 {
            super.draw(rect)
        } else {
            let countFont = UIFont(name: titleLabel.font.fontName,
                                   size: titleLabel.font.pointSize - countDiffSize)!
            
            var countStringAttributes: [String: Any] = [:]
            countStringAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.font)] = countFont
            if let textColor = titleLabel.textColor {
                countStringAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor)] = textColor.withAlphaComponent(titleLabel.alpha)
            } else {
                countStringAttributes[convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor)] = UIColor.clear
            }
            let countString = NSAttributedString(string: String(badgeNumber), attributes: convertToOptionalNSAttributedStringKeyDictionary(countStringAttributes))
            let badgeSize = CGSize(width: countString.size().width + countEdgeInsets.left + countEdgeInsets.right,
                                   height: countString.size().height + countEdgeInsets.top + countEdgeInsets.bottom)
            
            let inset = (badgeSize.width + margin) / 2
            titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -inset, bottom: 0, right: inset)
            
            let countPoint = CGPoint(x: titleLabel.frame.maxX + margin + countEdgeInsets.left - inset + titleEdgeInsets.right,
                                     y: titleLabel.frame.midY - (countString.size().height / 2))
            
            countString.draw(at: countPoint)
            
            let badgeRect = CGRect(x: countPoint.x - countEdgeInsets.left,
                                   y: countPoint.y - countEdgeInsets.top,
                                   width: badgeSize.width,
                                   height: badgeSize.height)
            
            let badgePath = UIBezierPath(rect: badgeRect)
            badgePath.lineWidth = lineWidth
            titleLabel.textColor.withAlphaComponent(titleLabel.alpha).set()
            badgePath.stroke()
        }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
