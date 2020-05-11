//
//  Group.swift
//  appVK
//
//  Created by Sergey Desyak on 01.12.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

class Group {
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
