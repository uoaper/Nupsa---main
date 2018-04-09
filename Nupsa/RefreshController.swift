//
//  RefreshController.swift
//  Nupsa
//
//  Created by Vladimir Pertsov on 07.02.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class RefreshController: UIView {
    
    init(frame: CGRect, themeColor: UIColor) {
        super.init(frame: frame)
        
        NotificationCenter.default.addObserver(self, selector: #selector(RefreshButton), name: NSNotification.Name(rawValue: "reload"), object: nil)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    
    
    
    
    
   
    
    @IBAction func RefreshButton(_ sender: Any) {
        print("Button pushed")
        let service = APIService()
        service.getDataWith { (result) in
            switch result {
            case .Success(let data):
                self.saveInCoreDataWith(array: data)
              SendingJSON.updateObjects()
                print(data)
                
            case .Error(let message):
                DispatchQueue.main.async {
                    self.showAlertWith(title: "Error", message: message)
                }
            }
         NotificationCenter.default.post(name: .reload, object: nil)
        }
        
        print("Using Notification center")
       
    }
    
  
    
    private func createPhotoEntityFrom(dictionary: [String: Any]) -> NSManagedObject? {
        let context = CoreDataStackJSON.sharedInstance.persistentContainerFromJSON.viewContext
        if let mainEntity = NSEntityDescription.insertNewObject(forEntityName: "Main", into: context) as? Main {
            
            let dateFormatter = DateFormatter()
            let datestamp: String? = dictionary["datestamp"] as? String
            
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
            let defaultData:String =  "2001-01-01 12:01"
            
            mainEntity.adversity = dictionary["adversity"] as? String
            mainEntity.belief = dictionary["belief"] as? String
            mainEntity.conseq = dictionary["conseq"] as? String
            mainEntity.disput = dictionary["disput"] as? String
            mainEntity.energy = dictionary["energy"] as? String
          
            mainEntity.datestamp = dateFormatter.date(from: (datestamp ?? defaultData))
           
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
        
        }
        alertController.addAction(action)

    }
   
    
    
}









