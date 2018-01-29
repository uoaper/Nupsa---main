//
//  HomeModel.swift
//  Nupsa2
//
//  Created by Vladimir Pertsov on 09.11.17.
//  Copyright © 2017 Vladimir Pertsov. All rights reserved.
//

import Foundation

protocol HomeModelProtocol: class {
    func itemsDownloaded(_ items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocol!
    
    var data = Data()
    
    let urlPath: String = "http://47.91.91.22/service.php" //this will be changed to the path where service.php lives

    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }


func parseJSON(_ data:Data) {
    
    var jsonResult = NSArray()
    
    do{
        jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
      
        
    } catch let error as NSError {
        print(error)
        
    }
    
   // print(jsonResult)
    

    
    var jsonElement = NSDictionary()
    let locations = NSMutableArray()
    
    for i in 0 ..< jsonResult.count
    {
        
        jsonElement = jsonResult[i] as! NSDictionary
        
        let location = LogModel()
        
        //the following insures none of the JsonElement values are nil through optional binding
        if
           
            let adversity = jsonElement["adversity"] as? String,
            let belief = jsonElement["belief"] as? String,
            let conseq = jsonElement["conseq"] as? String,
            let disput = jsonElement["disput"] as? String,
            let energy = jsonElement["energy"] as? String,
        //    let id = jsonElement["id"] as? Int,
       
        let datetime = jsonElement["datetime"] as? String

      
      {
          location.datetime = datetime
            location.adversity = adversity
            location.belief = belief
            location.conseq = conseq
            location.disput = disput
            location.energy = energy
        //    location.id = id
   //      location.datetime = datetime
            
      }
        
        locations.add(location)
        

       
    }
    

    DispatchQueue.main.async(execute: { () -> Void in
        
        
        
        self.delegate.itemsDownloaded(locations)
    })
}
    
    
    
}
