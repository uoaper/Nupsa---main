//
//  PHQController.swift
//  Nupsa
//
//  Created by Vladimir Pertsov on 13.02.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PHQController: UIViewController {
   
    var managedObjectContext = CoreDataStack().managedObjectContext
    
    @IBOutlet weak var SliderOneOut: UISlider!
    @IBOutlet weak var SliderTwoOut: UISlider!
    @IBOutlet weak var SlidetThreeOut: UISlider!
    @IBOutlet weak var SliderFourOut: UISlider!
    @IBOutlet weak var SliderFiveOut: UISlider!
    @IBOutlet weak var SliderSixOut: UISlider!
    @IBOutlet weak var SliderSevenOut: UISlider!
    @IBOutlet weak var SliderEightOut: UISlider!
    @IBOutlet weak var SliderNineOut: UISlider!
    
    
    @IBOutlet weak var LabelOne: UILabel!
    @IBOutlet weak var LabelTwo: UILabel!
    @IBOutlet weak var LabelThree: UILabel!
    @IBOutlet weak var LabelFour: UILabel!
    @IBOutlet weak var LabelFive: UILabel!
    @IBOutlet weak var LabelSix: UILabel!
    @IBOutlet weak var LabelSeven: UILabel!
    @IBOutlet weak var LabelEight: UILabel!
    @IBOutlet weak var LabelNine: UILabel!
    
    @IBOutlet weak var TotalScore: UILabel!
    
    @IBOutlet weak var ButtonSaveOutlet: UIButton!
    var totalScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SliderOneOut.addTarget(self, action: #selector(sliderOneValueChanged(_:)), for: UIControlEvents.allEvents)
        SliderTwoOut.addTarget(self, action: #selector(sliderTwoValueChanged(_:)), for: UIControlEvents.allEvents)
    SlidetThreeOut.addTarget(self, action: #selector(sliderThreeValueChanged(_:)), for: UIControlEvents.allEvents)
         SliderFourOut.addTarget(self, action: #selector(sliderFourValueChanged(_:)), for: UIControlEvents.allEvents)
         SliderFiveOut.addTarget(self, action: #selector(sliderFiveValueChanged(_:)), for: UIControlEvents.allEvents)
         SliderSixOut.addTarget(self, action: #selector(sliderSixValueChanged(_:)), for: UIControlEvents.allEvents)
         SliderSevenOut.addTarget(self, action: #selector(sliderSevenValueChanged(_:)), for: UIControlEvents.allEvents)
         SliderEightOut.addTarget(self, action: #selector(sliderEightValueChanged(_:)), for: UIControlEvents.allEvents)
         SliderNineOut.addTarget(self, action: #selector(sliderNineValueChanged(_:)), for: UIControlEvents.allEvents)
       
        let button = ButtonSaveOutlet
        if UserDefaults.standard.string(forKey: "idTokenGoogle") == nil && UserDefaults.standard.string(forKey: "idTokenFacebook") == nil  {
            button?.setTitle("You're not logged in", for: .normal)
            button?.backgroundColor = UIColor.red
        } else {
            button?.setTitle("Finish test", for: .normal)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let button = ButtonSaveOutlet
        if UserDefaults.standard.string(forKey: "idTokenGoogle") != nil || UserDefaults.standard.string(forKey: "idTokenFacebook") != nil  {
            button?.setTitle("Finish test", for: .normal)
            button?.backgroundColor = UIColor(red: 231/255, green: 255/255, blue: 214/255, alpha: 1.0)
        } else {
            button?.setTitle("You're not logged in", for: .normal)
            button?.backgroundColor = UIColor.red
        }
        
    }

    
    @IBAction func sliderOneValueChanged(_ sender: UISlider) {
        let currentValue = Int(SliderOneOut.value)
        print("Slider changing to \(currentValue) ?")
        switch (currentValue) {
             case 0:
                  LabelOne.text = "Not at all"
                 break
             case 1:
                LabelOne.text = "Several days"
                 break
             case 2:
               LabelOne.text = "More than half the days"
               
               case 3:
                LabelOne.text = "Nearly every day"
                 break
              default:
                  break
        }
        
   //     self.TotalScore.text = "Total score:\(  String(Int(SliderOneOut.value) + Int(SliderTwoOut.value) + Int(SlidetThreeOut.value) + Int(SliderFourOut.value) + Int(SliderFiveOut.value) + Int(SliderSixOut.value) + Int(SliderSevenOut.value) + Int(SliderEightOut.value) + Int(SliderNineOut.value)))"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.SliderOneOut.value = 0
        self.SliderTwoOut.value = 0
        self.SlidetThreeOut.value = 0
        self.SliderFourOut.value = 0
        self.SliderFiveOut.value = 0
        self.SliderSixOut.value = 0
        self.SliderSevenOut.value = 0
        self.SliderEightOut.value = 0
        self.SliderNineOut.value = 0
        
        self.LabelOne.text = "Not at all"
        self.LabelTwo.text = "Not at all"
        self.LabelThree.text = "Not at all"
        self.LabelFour.text = "Not at all"
        self.LabelFive.text = "Not at all"
        self.LabelSix.text = "Not at all"
        self.LabelSeven.text = "Not at all"
        self.LabelEight.text = "Not at all"
        self.LabelNine.text = "Not at all"
    }
    
    @IBAction func sliderTwoValueChanged(_ sender: Any) {
        let currentValue = Int(SliderTwoOut.value)
        print("Slider changing to \(currentValue) ?")
        switch (currentValue) {
        case 0:
            LabelTwo.text = "Not at all"
            break
        case 1:
            LabelTwo.text = "Several days"
            break
        case 2:
            LabelTwo.text = "More than half the days"
            
        case 3:
            LabelTwo.text = "Nearly every day"
            break
        default:
            break
        }
 //           self.TotalScore.text = "Total score:\(  String(Int(SliderOneOut.value) + Int(SliderTwoOut.value) + Int(SlidetThreeOut.value) + Int(SliderFourOut.value) + Int(SliderFiveOut.value) + Int(SliderSixOut.value) + Int(SliderSevenOut.value) + Int(SliderEightOut.value) + Int(SliderNineOut.value)))"
    }
    
  
    @IBAction func sliderThreeValueChanged(_ sender: Any) {
        let currentValue = Int(SlidetThreeOut.value)
        print("Slider changing to \(currentValue) ?")
        switch (currentValue) {
        case 0:
            LabelThree.text = "Not at all"
            break
        case 1:
            LabelThree.text = "Several days"
            break
        case 2:
            LabelThree.text = "More than half the days"
            
        case 3:
            LabelThree.text = "Nearly every day"
            break
        default:
            break
        }
        
    //    self.TotalScore.text = "Total score:\(  String(Int(SliderOneOut.value) + Int(SliderTwoOut.value) + Int(SlidetThreeOut.value) + Int(SliderFourOut.value) + Int(SliderFiveOut.value) + Int(SliderSixOut.value) + Int(SliderSevenOut.value) + Int(SliderEightOut.value) + Int(SliderNineOut.value)))"
    }
    
    
    
    @IBAction func sliderFourValueChanged(_ sender: Any) {
        let currentValue = Int(SliderFourOut.value)
        print("Slider changing to \(currentValue) ?")
        switch (currentValue) {
        case 0:
            LabelFour.text = "Not at all"
            break
        case 1:
            LabelFour.text = "Several days"
            break
        case 2:
            LabelFour.text = "More than half the days"
            
        case 3:
            LabelFour.text = "Nearly every day"
            break
        default:
            break
        }
        
  //      self.TotalScore.text = "Total score:\(  String(Int(SliderOneOut.value) + Int(SliderTwoOut.value) + Int(SlidetThreeOut.value) + Int(SliderFourOut.value) + Int(SliderFiveOut.value) + Int(SliderSixOut.value) + Int(SliderSevenOut.value) + Int(SliderEightOut.value) + Int(SliderNineOut.value)))"
    }
    
    
    @IBAction func sliderFiveValueChanged(_ sender: Any) {
        let currentValue = Int(SliderFiveOut.value)
        print("Slider changing to \(currentValue) ?")
        switch (currentValue) {
        case 0:
            LabelFive.text = "Not at all"
            break
        case 1:
            LabelFive.text = "Several days"
            break
        case 2:
            LabelFive.text = "More than half the days"
            
        case 3:
            LabelFive.text = "Nearly every day"
            break
        default:
            break
        }
        
  //      self.TotalScore.text = "Total score:\(  String(Int(SliderOneOut.value) + Int(SliderTwoOut.value) + Int(SlidetThreeOut.value) + Int(SliderFourOut.value) + Int(SliderFiveOut.value) + Int(SliderSixOut.value) + Int(SliderSevenOut.value) + Int(SliderEightOut.value) + Int(SliderNineOut.value)))"
    }
    
    
    @IBAction func sliderSixValueChanged(_ sender: Any) {
        let currentValue = Int(SliderSixOut.value)
        print("Slider changing to \(currentValue) ?")
        switch (currentValue) {
        case 0:
            LabelSix.text = "Not at all"
            break
        case 1:
            LabelSix.text = "Several days"
            break
        case 2:
            LabelSix.text = "More than half the days"
            
        case 3:
            LabelSix.text = "Nearly every day"
            break
        default:
            break
        }
        
 //       self.TotalScore.text = "Total score:\(  String(Int(SliderOneOut.value) + Int(SliderTwoOut.value) + Int(SlidetThreeOut.value) + Int(SliderFourOut.value) + Int(SliderFiveOut.value) + Int(SliderSixOut.value) + Int(SliderSevenOut.value) + Int(SliderEightOut.value) + Int(SliderNineOut.value)))"
    }
    
    @IBAction func sliderSevenValueChanged(_ sender: Any) {
        let currentValue = Int(SliderSevenOut.value)
        print("Slider changing to \(currentValue) ?")
        switch (currentValue) {
        case 0:
            LabelSeven.text = "Not at all"
            break
        case 1:
            LabelSeven.text = "Several days"
            break
        case 2:
            LabelSeven.text = "More than half the days"
            
        case 3:
            LabelSeven.text = "Nearly every day"
            break
        default:
            break
        }
        

    }
    
    @IBAction func sliderEightValueChanged(_ sender: Any) {
        let currentValue = Int(SliderEightOut.value)
        print("Slider changing to \(currentValue) ?")
        switch (currentValue) {
        case 0:
            LabelEight.text = "Not at all"
            break
        case 1:
            LabelEight.text = "Several days"
            break
        case 2:
            LabelEight.text = "More than half the days"
            
        case 3:
            LabelEight.text = "Nearly every day"
            break
        default:
            break
        }
        
      //  self.TotalScore.text = "Total score:\(  String(Int(SliderOneOut.value) + Int(SliderTwoOut.value) + Int(SlidetThreeOut.value) + Int(SliderFourOut.value) + Int(SliderFiveOut.value) + Int(SliderSixOut.value) + Int(SliderSevenOut.value) + Int(SliderEightOut.value) + Int(SliderNineOut.value)))"
    }
    
    @IBAction func sliderNineValueChanged(_ sender: Any) {
        let currentValue = Int(SliderNineOut.value)
        print("Slider changing to \(currentValue) ?")
        switch (currentValue) {
        case 0:
            LabelNine.text = "Not at all"
            break
        case 1:
            LabelNine.text = "Several days"
            break
        case 2:
            LabelNine.text = "More than half the days"
            
        case 3:
            LabelNine.text = "Nearly every day"
            break
        default:
            break
        }
      
  
        
      
        
    }
    
    
    @IBAction func finish(_ sender: Any) {
        let scoreOne = Int(SliderOneOut.value) + Int(SliderTwoOut.value) + Int(SlidetThreeOut.value) + Int(SliderFourOut.value)
        let scoreTwo = Int(SliderFiveOut.value) + Int(SliderSixOut.value) + Int(SliderSevenOut.value)
        let scoreThree = Int(SliderEightOut.value) + Int(SliderNineOut.value)
        var resultText: String = ""
    
        let totalScore = scoreOne + scoreTwo + scoreThree
       
        if totalScore <= 4 { resultText = "None-minimal level of depression. You're perfectly health. Write us and we will send your money back of give it for some charity :)" }
            
        else if totalScore <= 9 { resultText = "Mild level of depression. Consider making nupsa 3 times a day for a month. Repeat test after that." }
            
        else if totalScore <= 14 { resultText = "Moderate level of depression. We suggest definitely try to make nupsa for a couple of months (3 - 5 times a day). Repeat test after that. Also consider counseling, follow-up, and/or prescription drugs." }
            
        else if totalScore <= 19 { resultText = "Moderately Severe level of depression. Oh - oh we really suggest you to visit  counseling and we hope our service will good support for you on the way to recovery." }
            
        else if totalScore <= 27 { resultText = "Severe level of depression. That's not good. We suggest you to go the therapist and we will be really proud if our service will help you to feel better." }
        
        
          self.TotalScore.text = "Result: \(String(scoreOne + scoreTwo)) \n\(resultText) "
            
        
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Tests", into: managedObjectContext) as! Tests
        //let appDelegate = AppDelegate()
        
        item.firstQuestion = Int16(SliderOneOut.value)
        item.secondQuestion = Int16(SliderTwoOut.value)
        item.thirdQuestion  = Int16(SlidetThreeOut.value)
        item.fourthQuestion = Int16(SliderFourOut.value)
        item.fifthQuestion = Int16(SliderFiveOut.value)
        item.sixthQuestion = Int16(SliderSixOut.value)
        item.seventhQuestion = Int16(SliderSevenOut.value)
        item.eigthQuestion = Int16(SliderEightOut.value)
        item.nineQuestion = Int16(SliderNineOut.value)
        item.totalScore = Int16(scoreOne + scoreTwo)
        item.datestamp = Date()
 //       item.token =  UserDefaults.standard.string(forKey: "idTokenGoogle")
  //      item.userIdByTokenHolder =  UserDefaults.standard.string(forKey: "UserIdByGoogle")
        
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
        
        if UserDefaults.standard.string(forKey: "userIdByGoogle") != nil {
            item.google_id = UserDefaults.standard.string(forKey: "userIdByGoogle")
            item.google_token = UserDefaults.standard.string(forKey: "idTokenGoogle")
        } else { item.google_id = ""
            item.google_token = ""
            print("we still dont have UserIdByGoogle fucking shit")}
        
        if UserDefaults.standard.string(forKey: "userIdByFacebook") != nil {
            item.facebook_id = UserDefaults.standard.string(forKey: "userIdByFacebook")
            item.facebook_token = UserDefaults.standard.string(forKey: "idTokenFacebook")
        } else { item.facebook_id = "" }
        
        
        // self.Responce.text = "Nupsa saved succesefull"
        managedObjectContext.saveChanges()
        
        dismiss(animated: true, completion: nil)
        
        
       // self.Energy.text = nil
      
        self.SliderOneOut.value = 0
        self.SliderTwoOut.value = 0
        self.SlidetThreeOut.value = 0
        self.SliderFourOut.value = 0
        self.SliderFiveOut.value = 0
        self.SliderSixOut.value = 0
        self.SliderSevenOut.value = 0
        self.SliderEightOut.value = 0
        self.SliderNineOut.value = 0
        
        self.LabelOne.text = "Not at all"
        self.LabelTwo.text = "Not at all"
        self.LabelThree.text = "Not at all"
        self.LabelFour.text = "Not at all"
        self.LabelFive.text = "Not at all"
        self.LabelSix.text = "Not at all"
        self.LabelSeven.text = "Not at all"
        self.LabelEight.text = "Not at all"
        self.LabelNine.text = "Not at all"
        
        NotificationCenter.default.post(name: .reload, object: nil)
        
        if Reachability.isConnectedToNetwork()  {
            SendingTestsJSON.sendRecordToServer() } else {
            print("no internet connection.Nupsa saved only in local memory")
        }
    }
    
   
}


