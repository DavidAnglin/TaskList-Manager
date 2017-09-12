//
//  CoreDataStack.swift
//  TaskListManager
//
//  Created by David Anglin on 9/12/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TaskListManager")
        container.loadPersistentStores() { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved Error: \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let container = self.persistentContainer
        return container.viewContext
    }()
}

extension NSManagedObjectContext {
    func saveChanges() {
        if self.hasChanges {
            do {
                try save()
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
    
    // This is the old way previous to iOS 10
    // Managed Object Model is a schema of all managed objects and their relationships to one another
    
//    private(set) lazy var applicationDocumentsDirectory: URL = {
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        
//        let endIndex = urls.index(before: urls.endIndex)
//        return urls[endIndex]
//    }()
//    
//
//    
//    private(set) lazy var managedObjectModel: NSManagedObjectModel = {
//        let modelUrl = Bundle.main.url(forResource: "TaskListManager", withExtension: "momd")
//        
//        return NSManagedObjectModel(contentsOf: modelUrl!)
//    }()
//    
//    private(set) lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
//        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
//        let url = self.applicationDocumentsDirectory.appendingPathComponent("TaskListManager.sqlite")
//        
//        do {
//            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url)
//        } catch {
//            print(error)
//            abort()
//        }
//        
//        return coordinator
//    }()
//    
//    lazy var managedObjectContext: NSManagedObjectContext = {
//        let coordinator = self.persistentStoreCoordinator
//        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//        moc.persistentStoreCoordinator = coordinator
//        
//        return moc
//    }()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
