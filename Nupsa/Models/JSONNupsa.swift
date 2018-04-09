//
//  JSONNupsa.swift
//  Nupsa
//
//  Created by Vladimir Pertsov on 02.02.18.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//

import Foundation
import Gloss

struct JSONNupsaStruct: JSONDecodable {
    let adversity: String?
    let belief: String?
    let conseq: String?
    let disput: String?
    let energy: String?
    let datestamp: String?
    
    
    
    init?(json: JSON) {
        self.adversity = "adversity"  <~~ json
        self.belief = "belief"  <~~ json
        self.conseq = "conseq"  <~~ json
        self.disput = "disput"  <~~ json
        self.energy = "energy"  <~~ json
        self.datestamp = "datetime" <~~ json
        }
    
    enum Result <T>{
        case Success(T)
        case Error(String)
    }
    
}
