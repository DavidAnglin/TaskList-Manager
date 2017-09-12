//
//  TaskManagerController.swift
//  TaskListManager
//
//  Created by David Anglin on 9/12/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit
import CoreData

class TaskManagerController: UITableViewController {
    
    let managedObjectContext = CoreDataStack().managedObjectContext
    
    lazy var dataSource: TaskManagerDataSource = {
        return TaskManagerDataSource(tableView: self.tableView, context: self.managedObjectContext)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }
    
    // MARK: - Navigation -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItem" {
            let navigationController = segue.destination as! UINavigationController
            let addTaskController = navigationController.topViewController as! AddTaskController
            
            addTaskController.managedObjectContext = self.managedObjectContext
        } else if segue.identifier == "showDetail" {
            guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            let item = dataSource.object(at: indexPath)
            detailVC.item = item
            detailVC.context = self.managedObjectContext
        }
    }
    
    // MARK: - TableView Delegate -
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
}
