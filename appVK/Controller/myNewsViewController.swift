//
//  myNewsViewController.swift
//  appVK
//
//  Created by Sergey Desyak on 03.06.2020.
//  Copyright © 2020 Sergey Desyak. All rights reserved.
//

import UIKit

class myNewsViewController: UITableViewController {

    private var searchResults = [News]()
    let searchController = UISearchController(searchResultsController: nil)
    
    let news = [
        News(image: [UIImage(named: "pikachu")!], title: "Иван Иванов", textNews: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text", isChecked: true , countChecked: 50 ),
        News(title: "Петя Петров", textNews: "Some text"),
        News(title: "Вася Васин", textNews: "Some text"),
        News(title: "Костя Костин", textNews: "Some text", isChecked: true , countChecked: 100),
        News(title: "Гена Геннадьев", textNews: "Some text")
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
        

    }

    
    func filterContent(for searchText: String) {
        searchResults = news.filter({( news: News) -> Bool in
            let match = news.title.range(of: searchText)
            return match != nil
        })
        
    // MARK: - Table view data source


        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100

}
}

extension myNewsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchController.isActive ?  searchResults.count : news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
            preconditionFailure("FriendCell cannot be dequeued")
        }

        let cellnews = searchController.isActive ? searchResults[indexPath.row] : news[indexPath.row]

        
        let countsLikes: Int = cellnews.countChecked ?? 0
        let isNewsChecked = cellnews.isChecked ?? false
        cell.configureHeart(countLikes: countsLikes , isFill: isNewsChecked)
        //cell.textNews.text = cellnews.textNews
        
        
        cell.titleNews.text = cellnews.title
        if cellnews.image.count > 0 {
            
            let textAttachment = NSTextAttachment()
            textAttachment.image = cellnews.image[0]
            let scale = cellnews.image[0].size.height/cellnews.image[0].size.width
            textAttachment.bounds = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width * scale)
         
           
            let range = NSMakeRange(cellnews.textNews.count, 0)
            let atributedstring = NSMutableAttributedString(string: cellnews.textNews)
            let attrStringWithImage = NSAttributedString(attachment: textAttachment)
            atributedstring.replaceCharacters(in: range, with: attrStringWithImage)
            
            
            
            
            
            
           
            cell.textNews.attributedText = atributedstring
        } else {
            cell.textNews.text = cellnews.textNews
            
        }
        
        
        
        return cell
    }
    
    
}
extension myNewsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
    }
    

