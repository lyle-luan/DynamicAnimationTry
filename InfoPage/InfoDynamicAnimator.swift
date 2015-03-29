//
//  InfoDynamicAnimator.swift
//  InfoPage
//
//  Created by Aaron on 3/29/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

class InfoDynamicAnimator: UIDynamicAnimator
{
    lazy var gravity: UIGravityBehavior = {
        let lazilyGreateGravity = UIGravityBehavior()
        return lazilyGreateGravity
    }()
    
    lazy var collisor: UICollisionBehavior = {
        let lazilyCollisor = UICollisionBehavior()
        lazilyCollisor.translatesReferenceBoundsIntoBoundary = true
        return lazilyCollisor
    }()

    lazy var item: UIDynamicItemBehavior = {
        let lazilyItem = UIDynamicItemBehavior()
        lazilyItem.allowsRotation = false
        lazilyItem.elasticity = 0.7
        return lazilyItem
    }()
    
    var attach: UIAttachmentBehavior? {
        willSet {
            removeBehavior(attach)
        }
        
        didSet {
            self.addBehavior(attach)
        }
    }
    
    override init(referenceView view: UIView)
    {
        super.init(referenceView: view)
        self.addBehavior(gravity)
        self.addBehavior(collisor)
        self.addBehavior(item)
    }
    
    func addClientView(clientView: UIView)
    {
        self.referenceView?.addSubview(clientView)
        gravity.addItem(clientView)
        collisor.addItem(clientView)
        item.addItem(clientView)
    }
    
    func addCenterBarrier(path: UIBezierPath, named name: String)
    {
        collisor.removeBoundaryWithIdentifier(name)
        collisor.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addAttach(view: UIView, toPoint: CGPoint, inView: GameView)
    {
        attach = UIAttachmentBehavior(item: view, attachedToAnchor: toPoint)
        attach?.action = {[unowned self] in
            let path = UIBezierPath()
            path.moveToPoint(view.center)
            path.addLineToPoint(toPoint)
            inView.addPath(path, named: "attachPath")
        }
        self.addBehavior(attach)
    }
}
