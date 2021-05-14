//
//  EateriesList+CoreDataProperties.swift
//  Eateries
//
//  Created by Weiye Zhou on 14/5/21.
//
//

import Foundation
import CoreData


extension EateriesList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EateriesList> {
        return NSFetchRequest<EateriesList>(entityName: "EateriesList")
    }

    @NSManaged public var name: String?
    @NSManaged public var title: String?
    @NSManaged public var eateries: NSOrderedSet?

}

// MARK: Generated accessors for eateries
extension EateriesList {

    @objc(insertObject:inEateriesAtIndex:)
    @NSManaged public func insertIntoEateries(_ value: Eateries, at idx: Int)

    @objc(removeObjectFromEateriesAtIndex:)
    @NSManaged public func removeFromEateries(at idx: Int)

    @objc(insertEateries:atIndexes:)
    @NSManaged public func insertIntoEateries(_ values: [Eateries], at indexes: NSIndexSet)

    @objc(removeEateriesAtIndexes:)
    @NSManaged public func removeFromEateries(at indexes: NSIndexSet)

    @objc(replaceObjectInEateriesAtIndex:withObject:)
    @NSManaged public func replaceEateries(at idx: Int, with value: Eateries)

    @objc(replaceEateriesAtIndexes:withEateries:)
    @NSManaged public func replaceEateries(at indexes: NSIndexSet, with values: [Eateries])

    @objc(addEateriesObject:)
    @NSManaged public func addToEateries(_ value: Eateries)

    @objc(removeEateriesObject:)
    @NSManaged public func removeFromEateries(_ value: Eateries)

    @objc(addEateries:)
    @NSManaged public func addToEateries(_ values: NSOrderedSet)

    @objc(removeEateries:)
    @NSManaged public func removeFromEateries(_ values: NSOrderedSet)

}
