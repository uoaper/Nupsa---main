//
//  UserDefaults.swift
//  Nupsa
//
//  Created by Vladimir Pertsov on 01.02.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import Foundation

extension UserDefaults{
    
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        //synchronize()
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    //MARK: Save User Data
    func setUserID(value: Int){
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getUserID() -> Int{
        return integer(forKey: UserDefaultsKeys.userID.rawValue)
    }
}

enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
    case idTokenGoogle
    case userIdByGoogle
    case idTokenFacebook
    case userIdByFacebook
    case google_id
    case facebook_id
    case google_token
    case facebook_token
    
    
}
