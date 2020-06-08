//
//  ProgressBar.swift
//  appVK
//
//  Created by Sergey Desyak on 08.06.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class ProgressBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let pathRect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: rect.width/2)
        let color = UIColor.blue
        color.setFill()
        path.fill()
    }
    
}


