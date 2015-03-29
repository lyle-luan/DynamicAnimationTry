//
//  CenterView.swift
//  InfoPage
//
//  Created by Aaron on 3/29/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

class CenterView: UIView
{
    override func drawRect(rect: CGRect)
    {
        let path = UIBezierPath(ovalInRect: rect)
        UIColor.blueColor().setFill()
        path.fill()
        
        let hexagonPath = UIBezierPath()
        let radius = rect.width/2
        hexagonPath.moveToPoint(CGPoint(x: 0, y: radius))
        let x1 = radius-radius*sin(CGFloat(M_PI/6))
        let y1 = radius-radius*cos(CGFloat(M_PI/6))
        hexagonPath.addLineToPoint(CGPoint(x: x1, y: y1))
        hexagonPath.addLineToPoint(CGPoint(x: x1+radius, y: y1))
        hexagonPath.addLineToPoint(CGPoint(x: rect.width, y: radius))
        hexagonPath.addLineToPoint(CGPoint(x: x1+radius, y: y1+radius*sqrt(3)))
        hexagonPath.addLineToPoint(CGPoint(x: x1, y: y1+radius*sqrt(3)))
        hexagonPath.closePath()
        hexagonPath.stroke()
    }
}
