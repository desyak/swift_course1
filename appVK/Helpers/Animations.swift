//
//  Anomations.swift
//  appVK
//
//  Created by Sergey Desyak on 26.08.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class AnimationPush: NSObject , UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    private let presenting: Bool
     
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let container = transitionContext.containerView
        let fromView = transitionContext.viewController(forKey: .from)!
        let toView = transitionContext.viewController(forKey: .to)!
        let offScreenRotateIn = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        let offScreenRotateOut = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
       
        
    
        toView.view.transform = self.presenting ? offScreenRotateIn : offScreenRotateOut
        
        toView.view.layer.anchorPoint = CGPoint(x:1, y:0)
        fromView.view.layer.anchorPoint = CGPoint(x:1, y:0)
        
        toView.view.layer.position = CGPoint(x: fromView.view.frame.width, y:0)
        fromView.view.layer.position = CGPoint(x: fromView.view.frame.width, y:0)
        
        if presenting {
            

     
            container.addSubview(toView.view)
            
        } else {
            container.insertSubview(toView.view, belowSubview: fromView.view)
     
        }
        

        let duration = self.transitionDuration(using: transitionContext)
        

        UIView.animate(withDuration: duration, animations: {
            if self.presenting {
                
                fromView.view.transform = offScreenRotateOut            } else {
                fromView.view.transform = offScreenRotateIn
            }
            toView.view.transform = .identity
        }) { finished in
            let success = !transitionContext.transitionWasCancelled
            if !success {
                toView.view.removeFromSuperview()
                
            } else {
                fromView.view.transform = .identity
            }
            
            transitionContext.completeTransition(true)
        }
        
        print("Push")
    }
    
    init(presenting: Bool) {
        self.presenting = presenting
    }
    
}
