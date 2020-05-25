//
//  FriendCell.swift
//  appVK
//
//  Created by Sergey Desyak on 18.11.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet var avatarView: AvatarView!
    @IBOutlet var friendImageView: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var heartLike: HeartView!
    
    @IBInspectable var heartShadowRadius: CGFloat = 7
    @IBInspectable var heartShadowOpacity: Float = 0.8
    @IBInspectable var heartShadowColor: UIColor = .black
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarView.shadowView.layer.shadowColor = heartShadowColor.cgColor
        avatarView.shadowView.layer.shadowOffset = .zero
        avatarView.shadowView.layer.shadowRadius = heartShadowRadius
        avatarView.shadowView.layer.shadowOpacity = heartShadowOpacity
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        friendImageView.layer.cornerRadius = bounds.height/2
        avatarView.shadowView.layer.cornerRadius = bounds.height/2
    }
    
}
