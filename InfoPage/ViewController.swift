//
//  ViewController.swift
//  InfoPage
//
//  Created by Aaron on 3/29/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameView: GameView!
    @IBOutlet weak var centerView: CenterView!

    lazy var animator: InfoDynamicAnimator = {
        return InfoDynamicAnimator(referenceView: self.gameView)
    }()
    
    override func viewDidLoad()
    {
        gameView.backgroundColor = UIColor.clearColor()
        centerView.backgroundColor = UIColor.clearColor()
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        let path = UIBezierPath(ovalInRect: centerView.frame)
        animator.addCenterBarrier(path, named: "CenterBarrier")
    }

    @IBAction func tap(tapGesture: UITapGestureRecognizer)
    {
        let clientCenter = tapGesture.locationInView(gameView)
        let size = CGSize(width: 50, height: 50)
        
        let clientView = ClientView(frame: CGRectMake(clientCenter.x-size.width/2, clientCenter.y-size.height/2, size.width, size.height))
        clientView.backgroundColor = UIColor.clearColor()
        
        animator.addClientView(clientView)
        animator.addAttach(clientView, toPoint: centerView.center, inView: gameView)
    }
}

