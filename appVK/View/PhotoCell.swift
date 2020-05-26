//
//  PhotoCell.swift
//  appVK
//
//  Created by Sergey Desyak on 18.11.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet var heartIsFillView: HeartView!
    @IBOutlet var galleryImage: UIImageView!
    
    @IBOutlet var countOfLikes: UILabel!
    
    func configureHeart(isFill: Bool, countLikes: Int?){
        heartIsFillView.configure(likes: countLikes!, isLikedByUser: isFill)
    }
    
    
}
