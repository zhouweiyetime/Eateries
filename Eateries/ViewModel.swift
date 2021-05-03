//
//  ViewModel.swift
//  Eateries
//
//  Created by Weiye Zhou on 29/4/21.
//

import Foundation

// class to define an array which is a list of eateries.
class ViewModel: ObservableObject, Identifiable, Codable {
    //an array of Eatery
    @Published var model = [Eatery]()
    //a string for master view title
    @Published var title: String
    
    //defining basic properties to Encode and Decode Using Coding Keys
    enum CodingKeys: String, CodingKey {
        case model
        case title
    }
    
    //initial view model
    init() {
        model = [Eatery]()
        self.title = "The Best Eateries:"
    }
    
    //conform to the Decodable protocol by implementing its required initializer
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        model = try container.decode([Eatery].self, forKey: .model)
        title = try container.decode(String.self, forKey: .title)
    }
    
    //conform to the Encodable protocol by implementing its required function
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(model, forKey: .model)
        try container.encode(title, forKey: .title)
    }
    
    //function to add a eatery in viewModel
    func addElement() {
        _ = model.count + 1
        let eateries = Eatery(EateriesImage: "", EateriesName: "<New>", EateriesLocation: "Enter Location", EateriesNote: "Enter Note", EateriesReview: "Enter Review")
        model.append(eateries)
        
    }
    
    //function to delete Eatery from viewModel
    func remove(at indices: IndexSet) {
        model.remove(atOffsets: indices)
    }
    
}
