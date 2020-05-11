//
//  myFriendsController.swift
//  appVK
//
//  Created by Sergey Desyak on 10.11.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

class myWall: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.navigationItem.backBarButtonItem = UIBarButtonItem (title: "Выход", style: .plain, target: nil, action: nil)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
