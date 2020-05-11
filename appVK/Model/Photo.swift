//
//  Photo.swift
//  appVK
//
//  Created by Sergey Desyak on 08.12.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

class Photo {
    var idPhoto: UIImage
    var isChecked: Bool?
    var countChecked: Int?
    
    init(idPhoto: UIImage, isChecked: Bool, countChecked: Int) {
        self.idPhoto = idPhoto
        self.isChecked = isChecked
        self.countChecked = countChecked
    }
    
    init(idPhoto: UIImage) {
        self.idPhoto = idPhoto
    }
    
    
}

