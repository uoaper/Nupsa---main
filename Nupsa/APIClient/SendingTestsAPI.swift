//
//  SendingApiPart.swift
//  Nupsa
//
//  Created by Vladimir Pertsov on 16.02.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import Foundation
import CoreData


class SendingTestsJSON: NSObject {
    
    var MyEntity = [String]()
    //URL to our web service
    let URL_SAVE_TEAM = "http://47.91.91.22/api/TestsInsert.php"
    
    
    class func sendRecordToServer() {
        
        
        let managedObjectContext = CoreDataStack().managedObjectContext
        let fetchRequest = NSFetchRequest<NSDictionary>(entityName:"Tests")
        
        fetchRequest.resultType = .dictionaryResultType
        //check only for not synched records
        fetchRequest.predicate = NSPredicate(format: "synched = %ld", 0)
        do {
            
            let records = try managedObjectContext.fetch(fetchRequest)
            print(records)
            
            
            
            var recordsSwift = records as! [[String:Any]]
            
            
            for (i, dict) in recordsSwift.enumerated() {
                let dateString = dict["datestamp"] as! NSDate
                
                let formatter = DateFormatter()
                
                
                
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let yourDate: String? = formatter.string(from: dateString as Date)
                formatter.dateFormat = "dd-MMM-yyyy"
                print(yourDate)
                
                
                recordsSwift[i]["datestamp"] = yourDate
            }
            
            
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: recordsSwift, options: [])
            {
                
                
                let URL_SAVE_DATA = URL(string: "http://47.91.91.22/api/TestsInsert.php")
                let request = NSMutableURLRequest(url: URL_SAVE_DATA!)
                
                print(jsonData)
                
                request.httpMethod = "POST"
                request.httpBody = jsonData
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                print(request)
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
                    updateObjects()
                    
                }
                task.resume()
                
                
            }
            
        } catch {
            print("Error fetching data from CoreData")
        }
        //  return records
    }
    
    class func updateObjects() {
        
        let managedObjectContext = CoreDataStack().managedObjectContext
        //   let empId = "001"
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Tests")
        let predicate = NSPredicate(format: "synched = %ld", 0 )
        fetchRequest.predicate = predicate
        print("we are here")
        do {
            let fetchedEntities = try managedObjectContext.fetch(fetchRequest) as! [Tests]
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
}




