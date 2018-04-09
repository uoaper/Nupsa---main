//
// LogController.swift
//  TodoList
//
//  Created by Vladimir Pertsov on 29.01.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import UIKit
import CoreData


class NupsaListController: UITableViewController {
    
    
    let managedObjectContext = CoreDataStack().managedObjectContext
    
    
    lazy var dataSource: DataSource = {
        return DataSource(tableView: self.tableView, context: self.managedObjectContext)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
           NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: .reload, object: nil)

      
        tableView.dataSource = dataSource
        
        
    }
    
    
    // Reload DataSource hitting Save throught Notification Centre
    
    @objc func reloadTableData(_ notification: Notification) {
       
      dataSource.fetchResultsController.tryFetch()
        tableView.reloadData()
        print("trying to reload")
    }

    //MARK: Delegate
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    
    
    
    //MARK: Navigation
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItem" {
            let navigationController = segue.destination as! UINavigationController
            let addNupsaController = navigationController.topViewController as! AddNupsaController
            
            addNupsaController.managedObjectContext = self.managedObjectContext
        }
        
        
        else if segue.identifier == "showDetail" {
            guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
 
            let item = dataSource.object(at: indexPath)
            
            detailVC.item = item
            detailVC.context = self.managedObjectContext
        }
    }
    
    
    // Не помню, что делает этот код, но точно не выводит данные в лог
    private func createPhotoEntityFrom(dictionary: [String: Any]) -> NSManagedObject? {
        let context = CoreDataStackJSON.sharedInstance.persistentContainerFromJSON.viewContext
        if let mainEntity = NSEntityDescription.insertNewObject(forEntityName: "Main", into: context) as? Main {
           print(mainEntity)
            
            let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            
            mainEntity.adversity = dictionary["adversity"] as? String
            mainEntity.belief = dictionary["belief"] as? String
            mainEntity.conseq = dictionary["conseq"] as? String
            mainEntity.disput = dictionary["disput"] as? String
            mainEntity.energy = dictionary["energy"] as? String
            mainEntity.datestamp = (dictionary["datetime"] as? Date)!
            

            return mainEntity
        }
        return nil
    }
 
    private func saveInCoreDataWith(array: [[String: Any]]) {
        _ = array.map{self.createPhotoEntityFrom(dictionary: $0)}
        do {
            try CoreDataStackJSON.sharedInstance.persistentContainerFromJSON.viewContext.save()
        } catch let error {
            print(error)
        }
    }
 
    
    func showAlertWith(title: String, message: String, style: UIAlertControllerStyle = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: title, style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
 
}


extension NupsaListController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
}






