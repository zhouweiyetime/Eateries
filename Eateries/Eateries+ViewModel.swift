//
//  Eateries+ViewModel.swift
//  Eateries
//
//  Created by Weiye Zhou on 13/5/21.
//

import Foundation
import CoreData

extension Eateries {
    //create string properties instead of the optional string properties
    //property of name
    var nameString: String {
        get { name ?? ""} // getter
        set { name = newValue} // setter
    }
    //property of image
    var imageString: String {
        get { image ?? ""}
        set { image = newValue}
    }
    //property of note
    var noteString: String {
        get { note ?? ""}
        set { note = newValue}
    }
    //property of location
    var locationString: String {
        get { location ?? ""}
        set { location = newValue}
    }
    //property of review
    var reviewString: String {
        get { review ?? ""}
        set { review = newValue}
    }
}
   
