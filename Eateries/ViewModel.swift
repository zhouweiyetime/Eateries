//
//  ViewModel.swift
//  Eateries
//
//  Created by Weiye Zhou on 29/4/21.
//

import Foundation

// class to define an array which is a list of eateries.
class ViewModel: ObservableObject, Identifiable {
    //an array of Eatery
    @Published var model = [Eatery]()
    //function to add a eatery in viewModel
    func addElement() {
        _ = model.count + 1
        let eateries = Eatery(EateriesImage: "", EateriesName: "<New>", EateriesLocation: "Enter Description", EateriesNote: "Enter Story", EateriesReview: "Enter Recipe")
        model.append(eateries)
        
    }
    
    //function to delete Eatery from viewModel
    func remove(at indices: IndexSet) {
        model.remove(atOffsets: indices)
    }
    
}
