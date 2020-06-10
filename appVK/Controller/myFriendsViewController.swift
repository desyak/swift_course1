//
//  myFriendsViewController.swift
//  appVK
//
//  Created by Sergey Desyak on 17.11.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

class myFriendsViewController: UITableViewController, UISearchResultsUpdating {
    
    
    private var searchResults = [Friend]()
    let searchController = UISearchController(searchResultsController: nil)
    private var sortedFriends = [Character: [Friend]]()
    @IBOutlet var photoFriend: UIImage!
    
    
    
    
    
    let friends = [
        Friend(image: UIImage(named: "pikachu")!, name: "Иван Иванов"),
        Friend(image: UIImage(named: "pikachu")!, name: "Петя Петров"),
        Friend(image: UIImage(named: "pikachu")!, name: "Вася Васин"),
        Friend(image: UIImage(named: "pikachu")!, name: "Костя Костин"),
        Friend(image: UIImage(named: "pikachu")!, name: "Гена Геннадьев")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Place the search bar in the table view's header.
        self.tableView.tableHeaderView = searchController.searchBar
        
        // Set the content offset to the height of the search bar's height
        // to hide it when the view is first presented.
        self.tableView.contentOffset = CGPoint(x: 0, y: searchController.searchBar.frame.height)
        navigationController?.setNavigationBarHidden(false, animated: true)
        let unsortedFriends = searchController.isActive ? searchResults.sorted {$0.name < $1.name} : friends.sorted {$0.name < $1.name}
        self.sortedFriends = sort(friends: unsortedFriends )
        
        
      
        
    }
    
    
    
    private func sort(friends: [Friend]) -> [Character: [Friend]] {
        var friendDict = [Character: [Friend]]()
        
        friends.forEach { friend in
            guard let firstChar = friend.name.first else {return}
            if var thisCharFriend = friendDict[firstChar] {
                thisCharFriend.append(friend)
                friendDict[firstChar] = thisCharFriend
            } else {
                friendDict[firstChar] = [friend]
            }
        }
        return friendDict
    }
    
    
    private func filterContent(for searchText: String) {
        searchResults = friends.filter({( friend: Friend) -> Bool in
            let match = friend.name.range(of: searchText)
            return match != nil
        })
        
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            let unsortedFriends = searchController.isActive ? searchResults.sorted {$0.name < $1.name} : friends.sorted {$0.name < $1.name}
            self.sortedFriends = sort(friends: unsortedFriends )
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
    
    
}


extension myFriendsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFriends.keys.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let firstChar = sortedFriends.keys.sorted()[section]
        return String(firstChar)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keysSorted = sortedFriends.keys.sorted()
        return sortedFriends[keysSorted[section]]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //let entry = searchController.isActive ? searchResults[indexPath.row] : friends[indexPath.row]
        let firstChar = sortedFriends.keys.sorted()[indexPath.section]
        let friends = sortedFriends[firstChar]!
        let friend: Friend = friends[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
            preconditionFailure("FriendCell cannot be dequeued")
        }
        
        print("Section: " + String(indexPath.section) + ", row: " + String(indexPath.row))
        let friendName = friend.name
        let friendImage = friend.image
        cell.friendNameLabel?.text = friendName
        cell.friendImageView?.image = friendImage
        
        
        return cell
    }
    

}
