//
//  DetailView.swift
//  Eateries
//
//  Created by Weiye Zhou on 29/4/21.
//

import SwiftUI

struct DetailView: View {
    //set instance for each Eatery
    @ObservedObject var eateries: Eatery
    let eateriesviewmodel = EateriesViewModel()
    @Environment(\.editMode) var editMode
    
    
    var body: some View {
            VStack(spacing: 1.0) {
            eateriesviewmodel.download(eateries.EateriesImage)
                .resizable()
                .scaledToFit()
                
//if the edit mode is on, show the editable textfield
        if editMode?.wrappedValue == .active {
            TextField("Enter image URL.", text: $eateries.EateriesImage, onCommit: {
                EateriesApp.save()
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
            
List {
    TextField("Enter Eateries name", text: $eateries.EateriesName, onCommit: {
        EateriesApp.save()
    })
            .font(.largeTitle)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .scaledToFit()
    
    TextField("Enter Location", text: $eateries.EateriesLocation, onCommit: {
        EateriesApp.save()
    })
                .font(.body)
                .scaledToFit()
    TextField("Enter Note", text: $eateries.EateriesNote, onCommit: {
        EateriesApp.save()
    })
                .padding([.top, .bottom, .trailing])

        Text("Review")
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .scaledToFit()
    TextField("Enter Review", text: $eateries.EateriesReview, onCommit: {
        EateriesApp.save()
    })
                 }
              }
            .toolbar{
                EditButton()}
      }
}
    



