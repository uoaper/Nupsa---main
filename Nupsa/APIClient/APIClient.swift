//
//  APIClient.swift
//  Nupsa
//
//  Created by Vladimir Pertsov on 02.02.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import Foundation
import Gloss

typealias FetchTripsCallback = ([JSONNupsaStruct]) -> Void


class APICLient {
    @IBAction func Refresh(_ sender: Any) {
        
        
    }
    func fetchTrips(completion: @escaping FetchTripsCallback) {
   
        
    
    let url: URL = URL(string: "http://47.91.91.22/service.php")!
    let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
    
    let task = defaultSession.dataTask(with: url) { (data, response, error) in
        
        if error != nil {
            print("Failed to download data")
            
        } else {
            print("Data downloaded")
        
        
            let jsonNupsaArray = try! JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.allowFragments) as! [JSON]
            
            guard let nupsa = [JSONNupsaStruct].from(jsonArray: jsonNupsaArray) else {
              return  print("something bad happened")
                
                
            }
            
            completion(nupsa)
            
        }
       
    }
    
    task.resume()
    }
    
}

