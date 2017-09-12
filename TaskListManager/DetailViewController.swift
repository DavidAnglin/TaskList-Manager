//
//  DetailViewController.swift
//  TaskListManager
//
//  Created by David Anglin on 9/12/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController : UIViewController {
    
    var item: Item?
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var detailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            detailTextField.text = item.text
        }
    }
    
    @IBAction func save(_ sender: Any) {
        if let item = item, let newText = detailTextField.text {
            item.text = newText
            context.saveChanges()
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        if let item = item {
            context.delete(item)
            context.saveChanges()
            navigationController?.popViewController(animated: true)
        }
    }
}
