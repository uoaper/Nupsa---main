//
//  SecondViewController.swift
//  Test
//
//  Created by Vladimir Pertsov on 09.11.17.
//  Copyright © 2017 Vladimir Pertsov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol  {
    
   
    
    //Properties
    
    var feedItems: NSArray = NSArray()

    var selectedLocation : LogModel = LogModel()
    var cellOrder: Int = 0
 
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        
        listTableView.estimatedRowHeight = 100
        listTableView.rowHeight = UITableViewAutomaticDimension
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        
        /* TableView Sorting
        feedItems.sorted(by: cellOrder)
        
        tableView.delegate = self */
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDidLoad()
        listTableView.reloadData()
    
    }
    
    func itemsDownloaded(_ items: NSArray) {
        
        feedItems = items
        
      //  print(feedItems)
        
        
        self.listTableView.reloadData()
        
      
    }
    
    /*
    class ArraySorting {
        static func dictionary(fromFile name: String, ofType type: String) throws -> [String: AnyObject] {
        guard let sortedFeed = feedItems as? [Date: String] else {
        throw InventoryError.conversionFailure
        }
            
            return sortedFeed
            
        }
        
    }
 
 */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cellIdentifier: String = "BasicCell"
        
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        myCell.textLabel?.numberOfLines = 0
        myCell.textLabel?.lineBreakMode = .byWordWrapping
    
        let item: LogModel = feedItems[indexPath.row] as! LogModel
        
       
        myCell.textLabel!.text = "\(item.datetime ?? "")\n Adversity - \(item.adversity ?? "")\n Belief -  \(item.belief ?? "")\n Consequence - \(item.conseq ?? "")\n Disputation - \(item.disput ?? "")\n Energization - \(item.energy ?? "")";
        
        return myCell
        
       
    }
    
}
