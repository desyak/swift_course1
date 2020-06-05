//
//  News.swift
//  appVK
//
//  Created by Sergey Desyak on 03.06.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class News {
    var image = [UIImage]()
    let title: String
    var textNews : String
    var isChecked: Bool?
    var countChecked: Int?
    
    init(image: [UIImage], title: String , textNews: String, isChecked: Bool, countChecked: Int) {
        self.image = image
        self.title = title
        self.textNews = textNews
        self.isChecked = isChecked
        self.countChecked = countChecked
    }
    
    init(title: String, textNews: String, isChecked: Bool, countChecked: Int) {
        self.textNews = textNews
        self.title = title
        self.isChecked = isChecked
        self.countChecked = countChecked
        
    }
    
    init(title: String, textNews: String) {
        self.textNews = textNews
        self.title = title
        
        
    }
}
