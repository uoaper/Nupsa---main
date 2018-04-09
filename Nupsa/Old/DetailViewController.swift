//
//  DetailViewController.swift
//  TodoList
//
//  Created by Vladimir Pertsov on 29.01.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    var item: Main?
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var detailTextField: UITextField!
    
    override func viewDidLoad() {
        
        if let item = item {
            detailTextField.text = item.adversity
        }
        
    }
    
    
    
    
    @IBAction func save(_ sender: Any) {
        
        if let item = item, let newText = detailTextField.text {
            item.adversity = newText
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

