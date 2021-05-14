//
//  DetialView.swift
//  Ecoredata
//
//  Created by Weiye Zhou on 14/5/21.
//


import SwiftUI
import CoreData

struct DetailView: View{
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var eateries: Eateries
    let eateriesviewmodel = EateriesViewModel()
    @Environment(\.editMode) var editMode
    
    
    var body: some View {
        VStack(spacing: 1.0) {
            eateriesviewmodel.download(eateries.imageString)
                .resizable()
                .scaledToFit()
            
            if editMode?.wrappedValue == .active {
                TextField("Enter image URL.", text: $eateries.imageString, onCommit: {
                    try? viewContext.save()
                }).onDisappear(perform: {
                    try? viewContext.save()
               })
            }
            
        List {
            TextField("Enter Student Name", text: $eateries.nameString, onCommit: {
                        try? viewContext.save()
                    }).onDisappear(perform: {
                        try? viewContext.save()
                   })
            .font(.largeTitle)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .scaledToFit()
            
            TextField("Enter Student Name", text: $eateries.locationString, onCommit: {
                        try? viewContext.save()
                    }).onDisappear(perform: {
                        try? viewContext.save()
                   })
            .font(.body)
            .scaledToFit()
            TextField("Enter Student Name", text: $eateries.noteString, onCommit: {
                        try? viewContext.save()
                    }).onDisappear(perform: {
                        try? viewContext.save()
                   })

                Text("Review")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .scaledToFit()
            TextField("Enter Student Name", text: $eateries.reviewString, onCommit: {
                        try? viewContext.save()
                    }).onDisappear(perform: {
                        try? viewContext.save()
                   })
                         }
    }.toolbar{
        EditButton()}
    }
    
}


