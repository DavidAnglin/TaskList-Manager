//
//  Item+CoreDataProperties.swift
//  TaskListManager
//
//  Created by David Anglin on 9/12/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        
        let request = NSFetchRequest<Item>(entityName: "Item")
        request.sortDescriptors = [NSSortDescriptor(key: "text", ascending: true)]
        return request
    }

    @NSManaged public var text: String
    @NSManaged public var isCompleted: Bool

}
