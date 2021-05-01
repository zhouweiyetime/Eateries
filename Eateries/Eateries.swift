//
//  Eateries.swift
//  Eateries
//
//  Created by Weiye Zhou on 29/4/21.
//

import Foundation
import SwiftUI

// define Eateries and related variables
class Eatery: ObservableObject, Identifiable, Codable {
    @Published var EateriesImage: String
    @Published var EateriesName: String
    @Published var EateriesLocation: String
    @Published var EateriesNote: String
    @Published var EateriesReview: String
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case EateriesImage
        case EateriesName
        case EateriesLocation
        case EateriesNote
        case EateriesReview
    }

    
    //initial each variable
    init(EateriesImage:String, EateriesName:String, EateriesLocation:String, EateriesNote: String, EateriesReview: String) {
        self.EateriesImage = EateriesImage
        self.EateriesName = EateriesName
        self.EateriesLocation = EateriesLocation
        self.EateriesNote = EateriesNote
        self.EateriesReview = EateriesReview
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        EateriesImage = try container.decode(String.self, forKey: .EateriesImage)
        EateriesName = try container.decode(String.self, forKey: .EateriesName)
        EateriesLocation = try container.decode(String.self, forKey: .EateriesLocation)
        EateriesNote = try container.decode(String.self, forKey: .EateriesNote)
        EateriesReview = try container.decode(String.self, forKey: .EateriesReview)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(EateriesImage, forKey: .EateriesImage)
        try container.encode(EateriesName, forKey: .EateriesName)
        try container.encode(EateriesLocation, forKey: .EateriesLocation)
        try container.encode(EateriesNote, forKey: .EateriesNote)
        try container.encode(EateriesReview, forKey: .EateriesReview)
    }
}
