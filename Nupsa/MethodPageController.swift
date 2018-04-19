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
    
    
    @IBAction func AboutButton(_ sender: Any) {
        
    let button = sender as! UIButton
        
        if button.titleLabel?.text == "Что такое Nupsa.me?" {
            button.setTitle("Hide", for: .normal )
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.About.isHidden = false
            })
        } else {
            
            button.setTitle("Что такое Nupsa.me?", for: .normal )
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.About.isHidden = true
            })
            
        }
        
       
    }
    
    @IBAction func MethodButton(_ sender: Any) {
        
        
        let button = sender as! UIButton
        
        if button.titleLabel?.text == "Как работает методика?" {
            button.setTitle("Hide", for: .normal )
            
             self.Method.isHidden = false
   /*
            UIView.animate(withDuration: 0, animations: {
                
                self.Method.isHidden = false
            }) */
        } else {
            
            button.setTitle("Как работает методика?", for: .normal )
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.Method.isHidden = true
            })
            
        }
        
        
    }
    
    @IBAction func ToDoButton(_ sender: Any) {
        
        let button = sender as! UIButton
        
        if button.titleLabel?.text == "Что нужно делать?" {
            button.setTitle("Hide", for: .normal )
            
            self.ToDo.isHidden = false
            /*
             UIView.animate(withDuration: 0, animations: {
             
             self.Method.isHidden = false
             }) */
        } else {
            
            button.setTitle("Что нужно делать?", for: .normal )
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.ToDo.isHidden = true
            })
            
        }
    }
    
    @IBAction func ImportantThingsButton(_ sender: Any) {
        let button = sender as! UIButton
        
        if button.titleLabel?.text == "2 Важные вещи" {
            button.setTitle("Hide", for: .normal )
            
            self.ImportantThings.isHidden = false
            /*
             UIView.animate(withDuration: 0, animations: {
             
             self.Method.isHidden = false
             }) */
        } else {
            
            button.setTitle("2 Важные вещи", for: .normal )
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.ImportantThings.isHidden = true
            })
            
        }
        
        
    }
    
    @IBAction func BasePrinciplesButton(_ sender: Any) {
        let button = sender as! UIButton
        
        if button.titleLabel?.text == "Базовые принципы:" {
            button.setTitle("Hide", for: .normal )
            
            self.BasePrinciples.isHidden = false
            /*
             UIView.animate(withDuration: 0, animations: {
             
             self.Method.isHidden = false
             }) */
        } else {
            
            button.setTitle("Базовые принципы:", for: .normal )
            
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
