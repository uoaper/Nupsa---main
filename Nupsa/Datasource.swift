//
//  Datasource.swift
//  TodoList
//
//  Created by Vladimir Pertsov on 29.01.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import UIKit
import CoreData

class DataSource: NSObject, UITableViewDataSource {
   
    private let tableView: UITableView
    private let context: NSManagedObjectContext
    
    lazy var fetchResultsController: NupsaFetchResultController = {
        return NupsaFetchResultController(managedObjectContext: self.context, tableView: self.tableView)
        
    }()
    
    init(tableView: UITableView, context: NSManagedObjectContext) {
        self.tableView = tableView
        self.context = context
    }
    
    func object(at indexPath: IndexPath) -> Main {
        return fetchResultsController.object(at: indexPath)
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return fetchResultsController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let section = fetchResultsController.sections?[section] else {
            return 0
        }
        
        return section.numberOfObjects
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        return configureCell(cell, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let item = fetchResultsController.object(at: indexPath)
        context.delete(item)
        context.saveChanges()
        
    }
   
    
    private func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        let item = fetchResultsController.object(at: indexPath)
       
      print(item)
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
       formatter.locale = Locale(identifier: "en_US_POSIX")
        
      
       let formattedString = NSMutableAttributedString()
        let defaultData:Date = formatter.date(from: "2001-01-01 12:01")!
        
       formattedString
        
        .bold(formatter.string(from: item.datestamp ?? defaultData))
        .bold("\n Adverisity: ")
        .normal(item.adversity ?? "")
        .bold("\n Belief: ")
        .normal(item.belief ?? "")
        .bold("\n Consequence: ")
        .normal(item.conseq ?? "")
        .bold("\n Disputation: ")
        .normal(item.disput ?? "")
        .bold("\n Energization: ")
        .normal(item.energy ?? "")
        

    
        
        cell.textLabel?.attributedText = formattedString
        return cell
    }
    
}

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedStringKey: Any] = [.font: UIFont.boldSystemFont(ofSize: 17)]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}


