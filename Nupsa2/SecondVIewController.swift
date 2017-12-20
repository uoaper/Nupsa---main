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
        
    }
    
    func itemsDownloaded(_ items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        myCell.textLabel?.numberOfLines = 0
        myCell.textLabel?.lineBreakMode = .byWordWrapping
        // Get the location to be shown
        let item: LogModel = feedItems[indexPath.row] as! LogModel
        // Get references to labels of cell
        myCell.textLabel!.text = "Adversity - " + (item.adversity)! + " \n Belief - "  + (item.belief)! + " \n Consequence - " + (item.conseq)! + " \n Disputation - " + (item.disput)! + " \n Energization - " + (item.energy)!
        
        return myCell
    }
    
}
