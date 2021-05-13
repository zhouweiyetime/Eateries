//
//  EateriesCoreDataApp.swift
//  EateriesCoreData
//
//  Created by Weiye Zhou on 14/5/21.
//

import SwiftUI

@main
struct EateriesCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
