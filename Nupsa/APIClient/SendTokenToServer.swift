//
//  SendingTokenToSerfver.swift
//  Nupsa
//
//  Created by Vladimir Pertsov on 15.03.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import Foundation
import CoreData


class SendTokenToServer: NSObject {
    

    
    
    //URL to our web service
    class func sendRecordToServer(data: [[String: Any]]) {
        
     
        print(data)
   
        
    
        do {
    
            if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: [])
            {
                
                
                let URL_SAVE_DATA = URL(string: "http://www.nupsame/api/TokensInsert.php")
                let request = NSMutableURLRequest(url: URL_SAVE_DATA!)
                
                print("after serialization = \(jsonData)")
                
                request.httpMethod = "POST"
                request.httpBody = jsonData
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                print("а это неш реквест = \(request)")
                let task = URLSession.shared.dataTask(with: request as URLRequest){
                    data, response, error in
                    print(NSString(data: request.httpBody!, encoding:String.Encoding.utf8.rawValue)!)
                    
                    if error != nil{
                        print("error is \(String(describing: error))")
                        return;
                    }
                    
                    
                    
                    guard let data = data, error == nil else {
                        // check for fundamental networking error
                        print("error=\(String(describing: error?.localizedDescription))")
                        return
                        
                        
                    }
                    
                    let responseString = String(data: data, encoding: .utf8)
                    print("responseString = \(String(describing: responseString))")
         //           updateObjects()
                    
                }
                task.resume()
                
                
            }
            
        } catch {
            print("Error fetching data from CoreData")
        }
        // return records
    }
  
    /*
    class func updateObjects() {
        
        let managedObjectContext = CoreDataStack().managedObjectContext
        //   let empId = "001"
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Main")
        let predicate = NSPredicate(format: "synched = %ld", 0 )
        fetchRequest.predicate = predicate
        print("we are here")
        do {
            let fetchedEntities = try managedObjectContext.fetch(fetchRequest) as! [Main]
            let range = fetchedEntities.count
            print(fetchedEntities.count)
            if  range  > 0 {
                for i in (0..<range)
                {
                    
                    let attribute = fetchedEntities[i] as NSManagedObject
                    attribute.setValue(NSNumber(booleanLiteral: true) , forKey: "synched")
                    print("in for loop")
                }
            } else { }
            // ... Update additional properties with new values
        } catch {
            // Do something in response to error condition
        }
        
        do {
            try managedObjectContext.save()
            print(managedObjectContext)
            print("or even here")
            
        } catch {
            // Do something in response to error condition
        }
    }
 
    
    
    @objc func receiveToggleAuthUINotification(_ notification: NSNotification) {
        if notification.name.rawValue == "ToggleAuthUINotification" {
            self.toggleAuthUI()
            if notification.userInfo != nil {
                guard let userInfo = notification.userInfo as? [String:String] else { return }
                self.statusText.text = userInfo["statusText"]!
            }
 
 }
 
 }
*/
 }




