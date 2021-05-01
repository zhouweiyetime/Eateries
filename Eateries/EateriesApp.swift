//
//  EateriesApp.swift
//  Eateries
//
//  Created by Weiye Zhou on 29/4/21.
//

import SwiftUI

@main
struct EateriesApp: App {
    var eateriesViewModel: ViewModel {
        let eateries = [Eatery(EateriesImage: OTTOImage, EateriesName: "OTTO", EateriesLocation: OTTOLocation, EateriesNote: OTTONote, EateriesReview: OTTOReview),
                     
                    Eatery(EateriesImage: HIDEImage, EateriesName: "HIDE", EateriesLocation: HIDELocation, EateriesNote: HIDENote, EateriesReview: HIDEReview),
                    
                    Eatery(EateriesImage: WahImage, EateriesName: "Man Wah", EateriesLocation: WahLocation, EateriesNote: WahNote, EateriesReview: WahReview),
                    
                    Eatery(EateriesImage: grillImage, EateriesName: "Bus Grill", EateriesLocation: grillLocation, EateriesNote: grillNote, EateriesReview: grillReview),
                    
                    Eatery(EateriesImage: WONGImage, EateriesName: "MR.WONG", EateriesLocation: WONGLocation, EateriesNote: WONGNote, EateriesReview: WONGReview)]
        let viewModel = ViewModel()
        viewModel.model = eateries
        return viewModel
    }
    var body: some Scene {
        WindowGroup {
            ContentView(eateries: eateriesViewModel)
        }
    }
}
