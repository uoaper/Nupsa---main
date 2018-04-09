//
//  CoreDataStack.swift
//  TodoList
//
//  Created by Vladimir Pertsov on 24.01.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    

    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let container = self.persistentContainer
        
        return container.viewContext
    } ()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Nupsa")
        container.loadPersistentStores() { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error), \(error.userInfo)")
            }
        }
        return container
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









