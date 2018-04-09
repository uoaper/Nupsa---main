//
//  TodoFetchResultsController.swift
//  TodoList
//
//  Created by Vladimir Pertsov on 29.01.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import UIKit
import CoreData

class NupsaFetchResultController: NSFetchedResultsController<Main>, NSFetchedResultsControllerDelegate {
   
    private let tableView: UITableView
    
    init(managedObjectContext: NSManagedObjectContext,  tableView: UITableView) {
        self.tableView = tableView
        super.init(fetchRequest: Main.fetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        self.delegate = self
        
        tryFetch()
    }
    
    func tryFetch() {
        do {
            try performFetch()
        } catch {
            print("Unresolved error: \(error.localizedDescription)")
        }
    }
    
    
    //MARK - Fetch Results Controller Delegate
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    //    tableView.beginUpdates()
        
        print("TableView begin updates started")
    }
    

 
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
      //  tableView.endUpdates()
       tableView.reloadData()
    }
    
    
    
}

