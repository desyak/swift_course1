//
//  HeartView.swift
//  appVK
//
//  Created by Sergey Desyak on 05.12.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

class HeartView: UIView {
    let heartCheckColor = UIColor.red
    let heartUncheckColor = UIColor.blue
    var isHeartCheck = false
    let heartcolor = UIColor.red
    let heartEmpty = UIColor.clear
    public var isFilled = false
    public var coutLikes: Int = 0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(heartcolor.cgColor)
        context.setFillColor(heartcolor.cgColor)
        context.setLineWidth(4)
         let heart = UIBezierPath()
        let sideOne = rect.width * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2
        //Left Hand Curve
        context.addArc(center: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle:   CGFloat(135 * CGFloat.pi/180),
                       endAngle: CGFloat(315 * CGFloat.pi/180), clockwise: false)
        //Top Centre Dip
        context.addLine(to: CGPoint(x: rect.width/2, y: rect.height * 0.2))
        
        //Right Hand Curve
        context.addArc(center: CGPoint(x: rect.width * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle:
            CGFloat(225 * CGFloat.pi/180),endAngle:CGFloat(45 * CGFloat.pi/180),    clockwise: false)
        
        //Right Bottom Line
        context.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.95))
        
        //Left Bottom Line
        context.closePath()
        if isFilled {
            heart.fill()
        }
        // heart.stroke()
        //heart.fill()
        context.addPath(heart.cgPath)
        context.strokePath()
        
    }
}
