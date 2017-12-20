//
//  ViewController.swift
//  Nupsa1
//
//  Created by Vladimir Pertsov on 25.10.17.
//  Copyright © 2017 Vladimir Pertsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //URL to our web service
    let URL_SAVE_TEAM = "http://47.91.91.22/api/createteam.php"
    
    
    //TextFields declarations
    
    @IBOutlet weak var Scrollview: UIScrollView!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldMember: UITextField!
    
    @IBOutlet weak var Consequen: UITextField!
    
    @IBOutlet weak var Disput: UITextField!
    @IBOutlet weak var Energy: UITextField!
    
    @IBOutlet weak var Before: UITextField!
    @IBOutlet weak var After: UITextField!
    
   
    
    
    
    
    //Button action method
    @IBAction func ButtonSave(_ sender: UIButton) {
    
    
  
        
        
        
        //created NSURL
        let requestURL = URL(string: URL_SAVE_TEAM)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL!)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        //getting values from text fields
        let adversityText = textFieldName.text
        let beliefText = textFieldMember.text
       
        let conseqText = Consequen.text
        let disputText = Disput.text
        let energyText = Energy.text
        let beforeScore = Before.text
        let afterScore = After.text
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "Adversity="+adversityText!+"&Belief="+beliefText!+"&Consequen="+conseqText!+"&Disputation="+disputText!+"&Energization="+energyText!+"&Before="+beforeScore!+"&After="+afterScore!;
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using:String.Encoding.utf8)
        
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
             print(NSString(data: request.httpBody!, encoding:String.Encoding.utf8.rawValue)!)
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
            
            //parsing the response
            do {
                //converting resonse to NSDictionary
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary
                
                //parsing the json
                if let parseJSON = myJSON {
                    
                    //creating a string
                    var msg : String!
                    
                    //getting the json response
                    msg = parseJSON["message"] as! String?
                    
                    //printing the response
                    print(msg)
                    
                }
            } catch {
                print(error)
            }
           
        }
        //executing the task
        task.resume()
        self.Energy.text = nil
       self.Disput.text = nil
        self.textFieldName.text = nil
        self.textFieldMember.text = nil
        self.Consequen.text = nil
        self.After.text = nil
        self.Before.text = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    
    {
        
        if (textField == Disput || textField == Energy || textField == Before || textField == After)
    {
        Scrollview.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
        
    }
    }
    
   
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        Scrollview.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}


