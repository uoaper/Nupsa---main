//
//  MethodPageController.swift
//  Nupsa
//
//  Created by Vladimir Pertsov on 12.04.2018.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import Foundation
import UIKit

class MethodPageController: UIViewController {
      let attrString = NSMutableAttributedString(string: "Hide")
    
    @IBAction func AboutButton(_ sender: Any) {
        
    let button = sender as! UIButton
      
        if button.titleLabel?.text == "What is Nupsa.me?" {
            
            
            button.setAttributedTitle(attrString, for: .normal)
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.About.isHidden = false
            })
        } else {
            
            button.setAttributedTitle(NSMutableAttributedString(string: "What is Nupsa.me?"), for: .normal)
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.About.isHidden = true
            })
            
        }
        
       
    }
    
    @IBAction func MethodButton(_ sender: Any) {
        
        
        let button = sender as! UIButton
        
        if button.titleLabel?.text == "How does the technique work?" {
            button.setAttributedTitle(attrString, for: .normal)
            
             self.Method.isHidden = false
   /*
            UIView.animate(withDuration: 0, animations: {
                
                self.Method.isHidden = false
            }) */
        } else {
            
            button.setAttributedTitle(NSMutableAttributedString(string: "How does the technique work?"), for: .normal)
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.Method.isHidden = true
            })
            
        }
        
        
    }
    
    @IBAction func ToDoButton(_ sender: Any) {
        
        let button = sender as! UIButton
        
        if button.titleLabel?.text == "What do you have to do?" {
            button.setAttributedTitle(attrString, for: .normal)
            
            self.ToDo.isHidden = false
            /*
             UIView.animate(withDuration: 0, animations: {
             
             self.Method.isHidden = false
             }) */
        } else {
            
            button.setAttributedTitle(NSMutableAttributedString(string: "What do you have to do?"), for: .normal)
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.ToDo.isHidden = true
            })
            
        }
    }
    
    @IBAction func ImportantThingsButton(_ sender: Any) {
        let button = sender as! UIButton
        
        if button.titleLabel?.text == "2 important things:" {
            button.setAttributedTitle(attrString, for: .normal)
            
            self.ImportantThings.isHidden = false
            /*
             UIView.animate(withDuration: 0, animations: {
             
             self.Method.isHidden = false
             }) */
        } else {
            
            button.setAttributedTitle(NSMutableAttributedString(string: "2 important things:"), for: .normal)
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.ImportantThings.isHidden = true
            })
            
        }
        
        
    }
    
    @IBAction func BasePrinciplesButton(_ sender: Any) {
        let button = sender as! UIButton
        
        if button.titleLabel?.text == "Basic principles:" {
            button.setAttributedTitle(attrString, for: .normal)
            
            self.BasePrinciples.isHidden = false
            /*
             UIView.animate(withDuration: 0, animations: {
             
             self.Method.isHidden = false
             }) */
        } else {
            
            button.setAttributedTitle(NSMutableAttributedString(string: "Basic principles:"), for: .normal)
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.BasePrinciples.isHidden = true
            })
            
        }
        
        
    }
    
    
    @IBOutlet weak var About: UILabel!
    @IBOutlet weak var Method: UILabel!
    @IBOutlet weak var ToDo: UILabel!
    @IBOutlet weak var ImportantThings: UILabel!
    @IBOutlet weak var BasePrinciples: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
