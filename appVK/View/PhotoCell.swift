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
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(photoTap))
        galleryImage.addGestureRecognizer(tap)
        
        
    }
    
    var likesCount: Int? {
        didSet {
            countOfLikes.text = likesCount.flatMap(String.init)
        }
    }
    
    public func configureHeart(countLikes: Int?, isFill: Bool ){
        heartIsFillView.configure(likes: countLikes ?? 0, isLikedByUser: isFill)
        //countOfLikes.text = countLikes.flatMap(String.init)
        likesCount = countLikes
        heartIsFillView.addTarget(self, action: #selector(likeTapped), for: .valueChanged)
    }
    

    
    @objc private func likeTapped () {
        guard let likesCount = likesCount else {return}
    
        
        if  heartIsFillView.isChecked {
            self.likesCount = likesCount + 1

        } else {
            if (likesCount > 0) {
                self.likesCount = likesCount - 1
            }
        }
    }
    
    @objc private func photoTap() {
        let aspectPhoto = galleryImage.frame.size.width / galleryImage.frame.size.height
        let sizePhoto: CGSize = CGSize(width: galleryImage.frame.size.width + 20, height: (galleryImage.frame.size.width + 20)*aspectPhoto)
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [.autoreverse],
                       animations: {
                        self.galleryImage.frame.size = sizePhoto
        })
    }
    
}
