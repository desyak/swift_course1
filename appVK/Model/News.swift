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
    
    init(image: [UIImage], title: String , textNews: String) {
        self.image = image
        self.title = title
        self.textNews = textNews
    }
    
    init(title: String, textNews: String) {
        self.textNews = textNews
        self.title = title
        
    }
}
