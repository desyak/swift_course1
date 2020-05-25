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
    @IBInspectable var shadowColor = UIColor.black
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarView.shadowView.layer.shadowColor = shadowColor.cgColor
        avatarView.shadowView.layer.shadowOffset = .zero
        avatarView.shadowView.layer.shadowRadius = 7
        avatarView.shadowView.layer.shadowOpacity = 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        friendImageView.layer.cornerRadius = bounds.height/2
        avatarView.shadowView.layer.cornerRadius = bounds.height/2
    }
    
}
