//
//  GameView.swift
//  InfoPage
//
//  Created by Aaron on 3/29/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

class GameView: UIView
{
    var paths = [String: UIBezierPath]()
    
    func addPath(path: UIBezierPath, named name: String)
    {
        paths[name] = path
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        for (_, path) in paths
        {
            path.stroke()
        }
    }
}
