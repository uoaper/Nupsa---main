//
//  Main+CoreDataProperties.swift
//  
//
//  Created by Vladimir Pertsov on 31.01.18.
//
//

import Foundation
import CoreData


extension Main {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Main> {
        
        
        let request = NSFetchRequest<Main>(entityName:"Main")
        request.sortDescriptors = [NSSortDescriptor(key: "datestamp", ascending: false)]
        return request
    }

    @NSManaged public var adversity: String?
    @NSManaged public var afterScore: Int16
    @NSManaged public var beforeScore: Int16
    @NSManaged public var belief: String?
    @NSManaged public var conseq: String?
    @NSManaged public var datestamp: Date?
    @NSManaged public var disput: String?
    @NSManaged public var energy: String?
    @NSManaged public var token: String?
    @NSManaged public var userIdByTokenHolder: String?
    @NSManaged public var synched: NSNumber?
    @NSManaged public var tokenHolder: String?

}
