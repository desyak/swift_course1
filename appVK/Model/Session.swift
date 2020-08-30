//
//  Session.swift
//  appVK
//
//  Created by Sergey Desyak on 30.08.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class Session {
    var token: String = ""
    var userId: Int = 0
    
    public static let shared = Session()
    private init() {}
    
}
