//
//  AddNupsaController.swift
//  TodoList
//
//  Created by Vladimir Pertsov on 29.01.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import UIKit
import CoreData
import GoogleSignIn


class AddNupsaController: UIViewController, GIDSignInUIDelegate  {
    
    
    
var managedObjectContext = CoreDataStack().managedObjectContext
//  var managedObjectContext: NSManagedObjectContext!
    
   @IBOutlet weak var Scrollview: UIScrollView!
    @IBOutlet weak var Adversity: UITextField!
    @IBOutlet weak var Belief: UITextField!
    
    @IBOutlet weak var Consequen: UITextField!
    
    @IBOutlet weak var Disput: UITextField!
    @IBOutlet weak var Energy: UITextField!
    
    @IBOutlet weak var Before: UITextField!
    @IBOutlet weak var After: UITextField!
    
     @IBOutlet weak var Responce: UILabel!
    
    
    @IBOutlet weak var BeforeTextLabel: UILabel!
    
    @IBOutlet weak var ATextLabel: UILabel!
    @IBOutlet weak var BTextLabel: UILabel!
    @IBOutlet weak var CTextLabel: UILabel!
    @IBOutlet weak var DTextLabel: UILabel!
    @IBOutlet weak var ETextLabel: UILabel!
    @IBOutlet weak var AfterTextLabel: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
      
        NotificationCenter.default.addObserver(self, selector: #selector(ButtonSave), name: NSNotification.Name(rawValue: "load"), object: nil)
 
        
        print ("AddListControlles Context: \(managedObjectContext.description)")
     
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        
        // Uncomment to automatically sign in the user.
        GIDSignIn.sharedInstance().signInSilently()
    }
    
  
   @IBAction func ButtonSave(_ sender: Any)
    
    
   {
        
        guard let textAdversity = Adversity.text, !textAdversity.isEmpty else {
            return
        }
    
    guard let textBelief = Belief.text, !textBelief.isEmpty else {
        return
    }
    
    
    guard let textConseq = Consequen.text, !textConseq.isEmpty else {
        return
    }
    
    guard let textDisput = Disput.text, !textDisput.isEmpty else {
        return
    }
    
    guard let textEnergy = Energy.text, !textEnergy.isEmpty else {
        return
    }

    
    guard let scoreBefore = Int16(Before.text!) else {
      return   Responce.text = "Input values are not numeric"
    }
  
    guard let scoreAfter = Int16(After.text!) else {
       return  Responce.text = "Input values are not numeric"
    }
    
        let item = NSEntityDescription.insertNewObject(forEntityName: "Main", into: managedObjectContext) as! Main
       //let appDelegate = AppDelegate()
    
        item.adversity = textAdversity
        item.belief = textBelief
        item.conseq = textConseq
        item.disput = textDisput
        item.energy = textEnergy
        item.beforeScore = scoreBefore
        item.afterScore = scoreAfter
        item.datestamp = Date()
    //    item.token =  UserDefaults.standard.string(forKey: "idTokenGoogle")
   //     item.userIdByTokenHolder =  UserDefaults.standard.string(forKey: "UserIdByGoogle")
    
  
    if UserDefaults.standard.string(forKey: "idTokenGoogle") == nil && UserDefaults.standard.string(forKey: "idTokenFacebook") == nil {
        item.tokenHolder = "No token sorry"
    } else { if UserDefaults.standard.string(forKey: "idTokenGoogle") != nil {
        item.tokenHolder = "Google"
        
    } else {
       item.tokenHolder = "Facebook"
        }
    
    }
    
    
    if UserDefaults.standard.string(forKey: "idTokenGoogle") != nil {
       item.token = UserDefaults.standard.string(forKey: "idTokenGoogle")
    } else {
        item.token = UserDefaults.standard.string(forKey: "idTokenFacebook")
    }
    
   
    if UserDefaults.standard.string(forKey: "userIdByGoogle") != nil {
        item.userIdByTokenHolder = UserDefaults.standard.string(forKey: "userIdByGoogle")
    } else {
        item.userIdByTokenHolder = UserDefaults.standard.string(forKey: "userIdByFacebook")
    }
    
        self.Responce.text = "Nupsa saved succesefull"
        managedObjectContext.saveChanges()
        
        dismiss(animated: true, completion: nil)
    
    
    self.Energy.text = nil
    self.Disput.text = nil
    self.Adversity.text = nil
    self.Belief.text = nil
    self.Consequen.text = nil
    self.After.text = nil
    self.Before.text = nil
    
   NotificationCenter.default.post(name: .reload, object: nil)
   
    
        if Reachability.isConnectedToNetwork()  {
     SendingJSON.sendRecordToServer() } else {
            print("no internet connection.Nupsa saved only in local memory")
    }
    
    }

    
}



extension Notification.Name {
    static let reload = Notification.Name("reload")
}


