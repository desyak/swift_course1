//
//  CustomSegue.swift
//  appVK
//
//  Created by Sergey Desyak on 26.08.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        guard let containerView = source.view.superview else { return }
        
        let duration = 0.6
        let containerViewFrame = containerView.frame
        let offScreenRotateIn = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        let offScreenRotateOut = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: -containerViewFrame.height,
                                           width: source.view.frame.width,
                                           height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame
        destination.view.transform = offScreenRotateIn
        destination.view.layer.anchorPoint = CGPoint(x:1, y:0)
        destination.view.layer.position = CGPoint(x: source.view.frame.width, y:0)
        containerView.addSubview(destination.view)
        
        
        
        UIView
            .animate(withDuration: duration,
                     animations: {
                      self.source.view.transform = offScreenRotateOut
                        self.destination.view.transform = .identity
            }) { finished in
                self.source.present(self.destination,
                                    animated: false,
                                    completion: nil)
        }
    }
    

}
