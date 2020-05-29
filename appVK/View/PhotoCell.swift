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
    
    public func configureHeart(countLikes: Int?, isFill: Bool ){
        heartIsFillView.configure(likes: countLikes ?? 0, isLikedByUser: isFill)
        countOfLikes.text = countLikes.flatMap(String.init)
        
    }
    
    
}
