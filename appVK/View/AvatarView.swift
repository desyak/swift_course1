//
//  AvatarView.swift
//  appVK
//
//  Created by Sergey Desyak on 25.05.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit


class AvatarView: UIView {
    @IBOutlet var shadowView: UIView!
    @IBOutlet var friendImageView: UIImageView!
    
    @IBInspectable var heartShadowRadius: CGFloat = 7
    @IBInspectable var heartShadowOpacity: Float = 0.8
    @IBInspectable var heartShadowColor: UIColor = .black
    @IBOutlet var heartLike: HeartView!
    // @IBOutlet var friendImageView: UIImageView!
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
     
        shadowView.layer.shadowColor = heartShadowColor.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = heartShadowRadius
        shadowView.layer.shadowOpacity = heartShadowOpacity
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        friendImageView.layer.cornerRadius = bounds.height/2
        shadowView.layer.cornerRadius = bounds.height/2
    }
    
    

}
