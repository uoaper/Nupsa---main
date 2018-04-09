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
        loginButton.center = view.center
        loginButton.delegate = self
        if let token = FBSDKAccessToken.current() {
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
        // [END_EXCLUDE]
    }
    // [END signout_tapped]
    // [START disconnect_tapped]
    
    
    @IBAction func didTapDisconnect(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().disconnect()
        // [START_EXCLUDE silent]
        statusText.text = "Disconnecting."
        // [END_EXCLUDE]
    }
    // [END disconnect_tapped]
    
    
    // [START toggle_auth]
    func toggleAuthUI() {
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            // Signed in
            signInButton.isHidden = true
            signOutButton.isHidden = false
            disconnectButton.isHidden = false
            
        } else {
            signInButton.isHidden = false
            signOutButton.isHidden = true
            disconnectButton.isHidden = true
            statusText.text = "Google Sign in gopa"
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
      //  return true
    }
    
    func fetchProfile() {
        print("fetch profile")
        
        let parameters = ["fields": "email, first_name, last_name, picture.type(large), id, third_party_id"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start {
            (connection, result, error) in
            
            if error != nil {
                print(error)
                return
            } else {
            
          
           let item = result as? [String:Any]
            
                let email = item!["email"] as? String
                let id = item!["id"] as? String
                let thirdPartyId = item!["third_party_id"] as? String
                let tokenFromFacebook = FBSDKAccessToken.current().tokenString
            print(FBSDKAccessToken.current().tokenString)
                
                print(email)
                print(id)
                print(thirdPartyId)
         //       UserDefaults.standard.set(email, forKey: "emailByFacebook")
                UserDefaults.standard.set(id, forKey: "userIdByFacebook")
           UserDefaults.standard.set(tokenFromFacebook, forKey: "idTokenFacebook")
                
            }
        }
    }
    
    @objc func receiveToggleAuthUINotification(_ notification: NSNotification) {
        if notification.name.rawValue == "ToggleAuthUINotification" {
            self.toggleAuthUI()
            if notification.userInfo != nil {
                guard let userInfo = notification.userInfo as? [String:String] else { return }
                self.statusText.text = userInfo["statusText"]!
            }
        }
    }
 
}
