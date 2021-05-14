//
//  Eateries+CoreDataProperties.swift
//  Eateries
//
//  Created by Weiye Zhou on 14/5/21.
//
//

import Foundation
import CoreData


extension Eateries {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Eateries> {
        return NSFetchRequest<Eateries>(entityName: "Eateries")
    }

    @NSManaged public var name: String?
    @NSManaged public var location: String?
    @NSManaged public var note: String?
    @NSManaged public var image: String?
    @NSManaged public var review: String?
    @NSManaged public var list: EateriesList?

}
