//
//  AddTaskController.swift
//  TaskListManager
//
//  Created by David Anglin on 9/12/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit
import CoreData

class AddTaskController: UIViewController {

    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else { return }
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
        item.text = text
        
        managedObjectContext.saveChanges()
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
