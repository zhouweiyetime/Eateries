//
//  EateriesList+ViewModel.swift
//  Eateries
//
//  Created by Weiye Zhou on 13/5/21.
//

import Foundation
import CoreData

//extension of the eateries list
extension EateriesList{
    //convert to a eateries array or return an empty array
    var entries: [Eateries]{
        get { eateries?.array as? [Eateries] ?? [] }
        set { // set the new value as NSOrderSet
            eateries? = NSOrderedSet(array: newValue)
        }
    }
    //create a string property instead of the optional string property
    var titleString: String {
        get { title ?? ""} // getter
        set { title = newValue} // setter
    }
}
