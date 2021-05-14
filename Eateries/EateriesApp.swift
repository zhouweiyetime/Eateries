//
//  EateriesApp.swift
//  Eateries
//
//  Created by Weiye Zhou on 29/4/21.
//

import SwiftUI
import CoreData

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
    
    lazy var persistentContainer: NSPersistentContainer = {
        //define container name
        let container = NSPersistentContainer(name: "EateriesList")
        //load or create the container and print error message if there is an error
        container.loadPersistentStores{ (storeDescription, error) in
            if let actualError = error as NSError? {
                fatalError("Unresolved error \(actualError): \(actualError.userInfo)")
            }
        }
        return container
    }()
    
    //fucntion to save changes
    func saveContext(){
        let context = persistentContainer.viewContext
        //if the context changed, save them, if not, return
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch { //print error message if there is an error
            let nserror = error as NSError
            fatalError("Error \(nserror): \(nserror.userInfo)")
        }
    }
}

