//
//  myGroupViewController.swift
//  appVK
//
//  Created by Sergey Desyak on 01.12.2019.
//  Copyright © 2019 Sergey Desyak. All rights reserved.
//

import UIKit

/// <#Description#>
class MyGroupViewController: UITableViewController {

    @IBAction func addGroup(segue: UIStoryboardSegue) {
        // Проверяем идентификатор перехода, чтобы убедиться, что это нужный
        if segue.identifier == "addGroup" {
        // Получаем ссылку на контроллер, с которого осуществлен переход
            guard let allGroupController = segue.source as? AllGroupsViewController else { return }
        // Получаем индекс выделенной ячейки
            if let indexPath = allGroupController.tableView.indexPathForSelectedRow {
        // Получаем город по индексу
                let groups = allGroupController.allGroups[indexPath.row]
        // Проверяем, что такого города нет в списке
                if !myGroups.contains(where: { $0.name == groups.name }) {
        // Добавляем город в список выбранных
                    myGroups.append(groups)
        // Обновляем таблицу
                    tableView.reloadData()
                }
            }
        }

    }

    var myGroups = [
        Group
    ]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "My Groups", for: indexPath) as? GroupCell else {
            preconditionFailure("FriendCell cannot be dequeued")
        }
         //Configure the cell...

        let groupName = myGroups[indexPath.row].name
        let groupImage = myGroups[indexPath.row].image
        cell.groupName.text = groupName
        cell.groupImage.image = groupImage
        return cell
    }
    

//
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        //}
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
