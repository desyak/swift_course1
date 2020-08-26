//
//  TransitionManager.swift
//  appVK
//
//  Created by Sergey Desyak on 23.06.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import Foundation

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate  {
    
    // MARK: методы протокола UIViewControllerAnimatedTransitioning
    
    // метод, в котором непосредственно указывается анимация перехода от одного  viewcontroller к другому
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // код анимации
        guard let source = transitionContext.viewController(forKey: .from)  else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let π = CGFloat.pi
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: -containerViewFrame.height,
                                           width: source.view.frame.width,
                                           height: source.view.frame.height)
        let offScreenRotateIn = CGAffineTransform(rotationAngle: -π/2)
        let offScreenRotateOut = CGAffineTransform(rotationAngle: π/2)
        
        destination.view.layer.anchorPoint = CGPoint(x:0, y:source.view.frame.size.width)
        source.view.layer.anchorPoint = CGPoint(x:0, y:source.view.frame.size.width)
        
        let destinationViewTargetFrame = source.view.frame

        transitionContext.containerView.addSubview(destination.view)

        destination.view.frame = CGRect(x: 0,
                                        y: containerViewFrame.height,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)


        UIView
            .animate(withDuration: self.transitionDuration(using: transitionContext),
                     animations: {
                        source.view.frame = sourceViewTargetFrame
                        destination.view.frame = destinationViewTargetFrame
        }) { finished in
            source.removeFromParent()
            transitionContext.completeTransition(finished)
        }
    }
    
    // метод возвращает количество секунд, которые длится анимация
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    // MARK: методы протокола UIViewControllerTransitioningDelegate
    
    // аниматор для презентации viewcontroller
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    // аниматор для скрытия viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
}
