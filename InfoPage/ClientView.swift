//
//  ClientView.swift
//  InfoPage
//
//  Created by Aaron on 3/29/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

class ClientView: UIView
{
    override func drawRect(rect: CGRect)
    {
        let path = UIBezierPath(ovalInRect: rect)
        UIColor.yellowColor().setFill()
        path.fill()
    }
}
