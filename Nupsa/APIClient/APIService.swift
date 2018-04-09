//
//  APIService.swift
//  Nupsa
//
//  Created by Vladimir Pertsov on 07.02.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import Foundation
import Gloss




class APIService: NSObject {
    

    
    lazy var endPoint: String = { return "http://47.91.91.22/api/service.php" }  ()
        
        
        enum Result <T>
        {
            case Success(T)
            case Error(String)
        }
    
    
    
    func getDataWith(completion: @escaping (Result<[[String: Any]]>) -> Void) {
        guard let url = URL(string:endPoint ) else { return completion(.Error("Invalid URL, we can't update your feed")) }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return completion(.Error(error!.localizedDescription)) }
            guard let data = data else { return completion(.Error(error?.localizedDescription ?? "There are no new Items to show"))
            }
            do { print(data)
                print("we are post before jsonser")
                if let json = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as? NSArray
                
               
                {
                    print("we are before jsonser")
                    guard let itemsJsonArray = json as? [[String: Any]] else {
                       print(json)
                        print("we are in jsonser")
                        return completion(.Error(error?.localizedDescription ?? "There are no new Items to show"))
                   
                    }
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                    }
                }
                print("or maybe here?")
            } catch let error {
                print("maybe we get here?")
                return completion(.Error(error.localizedDescription))
            }
            }.resume()
    }
           
       
    }
    

