//
//  FriendCell.swift
//  appVK
//
//  Created by Sergey Desyak on 18.11.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    
    @IBOutlet var friendImageView: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [.autoreverse],
                       animations: {
            self.friendImageView.frame.origin.y -= 100
        })

    }

    
    
    

    
}
