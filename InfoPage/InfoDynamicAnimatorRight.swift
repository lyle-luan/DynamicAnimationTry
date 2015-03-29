//
//  InfoDynamicAnimatorUp.swift
//  InfoPage
//
//  Created by Aaron on 3/29/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

class InfoDynamicAnimatorRight: UIDynamicAnimator
{
    lazy var gravityRight: UIGravityBehavior = {
        let lazilyGreateGravity = UIGravityBehavior()
        lazilyGreateGravity.gravityDirection = CGVector(dx: CGFloat(1), dy: CGFloat(0))
        return lazilyGreateGravity
        }()
    
    override init(referenceView view: UIView)
    {
        super.init(referenceView: view)
        self.addBehavior(gravityRight)
    }
    
    func addClientView(clientView: UIView)
    {
        self.referenceView?.addSubview(clientView)
        gravityRight.addItem(clientView)
    }
}
