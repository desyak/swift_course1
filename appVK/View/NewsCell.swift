//
//  NewsCell.swift
//  appVK
//
//  Created by Sergey Desyak on 03.06.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet var titleNews: UILabel!
    @IBOutlet var likes: UILabel!
    @IBOutlet var textNews: UITextView!
    @IBOutlet var heartIsFillView: HeartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var likesCount: Int? {
        didSet {
            likes.text = likesCount.flatMap(String.init)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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

}
