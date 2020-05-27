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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    
    

    
}
