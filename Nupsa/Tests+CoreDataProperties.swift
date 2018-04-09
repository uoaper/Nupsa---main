//
//  Tests+CoreDataProperties.swift
//  
//
//  Created by Vladimir Pertsov on 13.02.18.
//
//

import Foundation
import CoreData


extension Tests {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tests> {
        return NSFetchRequest<Tests>(entityName: "Tests")
    }

    @NSManaged public var firstQuestion: Int16
    @NSManaged public var secondQuestion: Int16
    @NSManaged public var thirdQuestion: Int16
    @NSManaged public var fourthQuestion: Int16
    @NSManaged public var fifthQuestion: Int16
    @NSManaged public var sixthQuestion: Int16
    @NSManaged public var seventhQuestion: Int16
    @NSManaged public var eigthQuestion: Int16
    @NSManaged public var nineQuestion: Int16
    @NSManaged public var totalScore: Int16
    @NSManaged public var datestamp: NSDate?
    @NSManaged public var token: String?
    @NSManaged public var synched: NSNumber?
    @NSManaged public var userIdByTokenHolder	: String?
    @NSManaged public var tokenHolder: String?

}
