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
        friendImageView.isUserInteractionEnabled = true
    
        //let tap = UITapGestureRecognizer(target: self, action: #selector(photoTap()))
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(photoTap))
        tap.numberOfTapsRequired = 2
        friendImageView.addGestureRecognizer(tap)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        UIView.animate(withDuration: 0.5,
//                       delay: 0,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0,
//                       options: [.autoreverse],
//                       animations: {
//            self.friendImageView.frame.origin.y -= 100
//        })

    }

    @objc private func photoTap() {
        let aspectPhoto = friendImageView.frame.size.width / friendImageView.frame.size.height
        let sizePhoto: CGSize = CGSize(width: friendImageView.frame.size.width + 20, height: (friendImageView.frame.size.width + 20)*aspectPhoto)
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [.autoreverse],
                       animations: {
                        self.friendImageView.frame.size = sizePhoto
        })
    }
    
    

    
}
