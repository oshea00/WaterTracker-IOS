//
//  PushButton.swift
//  Flo
//
//  Created by mike oshea on 12/30/18.
//  Copyright © 2018 Future Trends. All rights reserved.
//

import UIKit

@IBDesignable
class PushButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    private struct Constants {
        static let plusLineWidth: CGFloat = 5.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        let plusPath = UIBezierPath()
        plusPath.lineWidth = Constants.plusLineWidth
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth + Constants.halfPointShift, y: halfHeight + Constants.halfPointShift))
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth + Constants.halfPointShift, y: halfHeight + Constants.halfPointShift))
        if isAddButton {
            plusPath.move(to: CGPoint(x: halfHeight + Constants.halfPointShift, y: halfWidth - halfPlusWidth + Constants.halfPointShift))
            plusPath.addLine(to: CGPoint(x: halfHeight + Constants.halfPointShift,y: halfWidth + halfPlusWidth + Constants.halfPointShift))
        }
        UIColor.white.setStroke()
        plusPath.stroke()
        
    }

}
