//
//  Eateries.swift
//  Eateries
//
//  Created by Weiye Zhou on 29/4/21.
//

import Foundation
import SwiftUI

// define Eateries and related variables
class Eatery: ObservableObject, Identifiable {
    @Published var EateriesImage: String
    @Published var EateriesName: String
    @Published var EateriesLocation: String
    @Published var EateriesNote: String
    @Published var EateriesReview: String

    
    //initial each variable
    init(EateriesImage:String, EateriesName:String, EateriesLocation:String, EateriesNote: String, EateriesReview: String) {
        self.EateriesImage = EateriesImage
        self.EateriesName = EateriesName
        self.EateriesLocation = EateriesLocation
        self.EateriesNote = EateriesNote
        self.EateriesReview = EateriesReview
    }
}
