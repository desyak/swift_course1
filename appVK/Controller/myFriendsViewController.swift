//
//  myFriendsViewController.swift
//  appVK
//
//  Created by Sergey Desyak on 17.11.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

class myFriendsViewController: UITableViewController {
    var friends = [
        Friend(image: UIImage(named: "pikachu")!, name: "Иван Иванов"),
        Friend(image: UIImage(named: "pikachu")!, name: "Петя Петров"),
        Friend(image: UIImage(named: "pikachu")!, name: "Вася Васин"),
        Friend(image: UIImage(named: "pikachu")!, name: "Костя Костин"),
        Friend(image: UIImage(named: "pikachu")!, name: "Гена Геннадьев")
    ]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
            preconditionFailure("FriendCell cannot be dequeued")
        }

        print("Section: " + String(indexPath.section) + ", row: " + String(indexPath.row))
        let friendName = friends[indexPath.row].name
        let friendImage = friends[indexPath.row].image
        cell.friendNameLabel.text = friendName
        cell.friendImageView.image = friendImage
        

        return cell
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
