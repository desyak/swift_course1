//
//  Friend.swift
//  appVK
//
//  Created by Sergey Desyak on 17.11.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

class Friend {
let image: UIImage?
let name: String

init(image: UIImage, name: String) {
    self.image = image
    self.name = name
}

init(name: String) {
    self.image = nil
    self.name = name
}
}
