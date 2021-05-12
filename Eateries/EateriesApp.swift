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
        let eateries = [Eatery(EateriesImage: OTTOImage, EateriesName: OTTOName, EateriesLocation: OTTOLocation, EateriesNote: OTTONote, EateriesReview: OTTOReview),
                     
                    Eatery(EateriesImage: HIDEImage, EateriesName: HIDEName, EateriesLocation: HIDELocation, EateriesNote: HIDENote, EateriesReview: HIDEReview),
                    
                    Eatery(EateriesImage: WahImage, EateriesName: WahName, EateriesLocation: WahLocation, EateriesNote: WahNote, EateriesReview: WahReview),
                    
                    Eatery(EateriesImage: grillImage, EateriesName: grillName, EateriesLocation: grillLocation, EateriesNote: grillNote, EateriesReview: grillReview),
                    
                    Eatery(EateriesImage: WONGImage, EateriesName: WONGName, EateriesLocation: WONGLocation, EateriesNote: WONGNote, EateriesReview: WONGReview)]
        let viewModel = ViewModel()
        viewModel.model = eateries
        return viewModel
    }
    

    static var Model: [Eatery] = {
        guard let data = try? Data(contentsOf: EateriesApp.fileURL),
              let Model = try? JSONDecoder().decode([Eatery].self, from: data) else
        {
            return [Eatery(EateriesImage: OTTOImage, EateriesName: "OTTO", EateriesLocation: OTTOLocation, EateriesNote: OTTONote, EateriesReview: OTTOReview)]
        }
        return Model
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView(eateries: eateriesViewModel)
        }
    }
    
    
    static var fileURL: URL {
        let fileName = "eateries.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for:  .documentDirectory, in: .userDomainMask).first else {return URL(fileURLWithPath: "/")}
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }
    
    static func save() {
        do {
            let data = try? JSONEncoder().encode(Model)
            try data?.write(to: fileURL, options: .atomic)
            guard let dataString = String(data: data!, encoding: .utf8) else {
                return }
            print(dataString)
        } catch {
            print("Could not write file: \(error)")
        }
    }
}
