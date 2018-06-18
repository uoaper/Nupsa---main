//
//  GoogleLogin.swift
//  Nupsa
//
//  Created by Vladimir Pertsov on 16.01.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn


//@objc(MenuViewController)
// [START viewcontroller_interfaces]
class MenuViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate, FBSDKLoginButtonDelegate {
   
    
  
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        
        button.readPermissions = ["email"]
    //    print(button.readPermissions = ["userid"])
        return button
    }()

    // [END viewcontroller_interfaces]
    // [START viewcontroller_vars]
   
    @IBOutlet weak var disconnectButton: UIButton!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
  
    
    var TokenId: String = ""
    // [END viewcontroller_vars]
    // [START viewdidload]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Facebook login
        view.addSubview(loginButton)
    //    loginButton.center.y = view.center.y - 50
    //    loginButton.center.x = signInButton.center.x
       loginButton.centerXAnchor.constraint(equalTo: signInButton.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: signInButton.centerYAnchor, constant: 150).isActive = true
      loginButton.autoresizesSubviews = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.delegate = self
        if (FBSDKAccessToken.current()) != nil {
            fetchProfile()
   
        }
        
        
        // Google login
        
        GIDSignIn.sharedInstance().uiDelegate = self
    // Uncomment to automatically sign in the user.
       GIDSignIn.sharedInstance().signInSilently()
        // TODO(developer) Configure the sign-in button look/feel
        // [START_EXCLUDE]
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(MenuViewController.receiveToggleAuthUINotification(_:)),
                                               name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
                                               object: nil)
        
      toggleAuthUI()
 
    }
    
    
    
    // [END viewdidload]
    // [START signout_tapped]
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        // [START_EXCLUDE silent]
        statusText.text = "Signed out."
        toggleAuthUI()
        UserDefaults.standard.set(nil, forKey: "userIdByGoogle")
        UserDefaults.standard.set(nil, forKey: "idTokenGoogle")
        // [END_EXCLUDE]
    }
    // [END signout_tapped]
    // [START disconnect_tapped]
    
    
    @IBAction func didTapDisconnect(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().disconnect()
        UserDefaults.standard.set(nil, forKey: "userIdByGoogle")
        UserDefaults.standard.set(nil, forKey: "idTokenGoogle")
        // [START_EXCLUDE silent]
        statusText.text = "Disconnecting."
        // [END_EXCLUDE]
    }
    // [END disconnect_tapped]
    
    
    // [START toggle_auth]
    func toggleAuthUI() {
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            // Signed in
            signInButton.isHidden = false
            signOutButton.isHidden = false
            disconnectButton.isHidden = false
            
        } else {
            signInButton.isHidden = false
            signOutButton.isHidden = true
            disconnectButton.isHidden = true
            if UserDefaults.standard.string(forKey: "userIdByFacebook") == nil { statusText.text = "You are not signed in. Please do it :)" }
        }
    }
    // [END toggle_auth]
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
  
                                                  object: nil)
    }
    
 
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard error == nil else {
            
            print("Error while trying to redirect : \(error)")
            return
        }
        
        print("Successful Redirection")
       
    }
 
    func loginButton( _ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error! ) {
        print ("completed login")
        fetchProfile()
    }
 
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        UserDefaults.standard.set(nil, forKey: "userIdByFacebook")
        UserDefaults.standard.set(nil, forKey: "idTokenFacebook")
        UserDefaults.standard.set(nil, forKey: "facebook_id")
        UserDefaults.standard.set(nil, forKey: "facebook_token")
        
       // return true
    }
    
    func fetchProfile() {
        print("fetch profile")
        
        let parameters = ["fields": "email, first_name, last_name, picture.type(large), id, third_party_id"]
       
        
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start {
            (connection, result, error) in
            
            if error != nil {
                print(error ?? "no error")
                return
            } else {
            
          
           let item = result as? [String:Any]
            
              //  let email = item!["email"] as? String
               let id = item!["id"] as? String
               // let thirdPartyId = item!["third_party_id"] as? String
                
                
            //    let first_name: String = (item!["first_name"] as? String)!
             //   let last_name: String = (item!["last_name"] as? String)!
               // var fullname = first_name + " " + last_name
                
                let tokenFromFacebook = FBSDKAccessToken.current().tokenString
            print(FBSDKAccessToken.current().tokenString)
             
         //       UserDefaults.standard.set(email, forKey: "emailByFacebook")
                UserDefaults.standard.set(id, forKey: "userIdByFacebook")
           UserDefaults.standard.set(tokenFromFacebook, forKey: "idTokenFacebook")
             UserDefaults.standard.set(id, forKey: "facebook_id")
              UserDefaults.standard.set(tokenFromFacebook, forKey: "facebook_token")
                self.statusText.text = "Facebook auth status ok"
                
            }
        }
    }
    
    @objc func receiveToggleAuthUINotification(_ notification: NSNotification) {
        if notification.name.rawValue == "ToggleAuthUINotification" {
            self.toggleAuthUI()
            if notification.userInfo != nil {
                guard (notification.userInfo as? [String:String]) != nil else { return }
                self.statusText.text = "Google auth status ok"
                    
                    //userInfo["statusText"]!
            }
        }
    }
 
}
