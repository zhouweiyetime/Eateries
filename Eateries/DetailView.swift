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
    
    var body: some View {
            VStack(spacing: 1.0) {
            eateriesviewmodel.download(eateries.EateriesImage)
                .resizable()
                .scaledToFit()
List {
        TextField("Enter Eateries name", text: $eateries.EateriesName)
            .font(.largeTitle)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .scaledToFit()
        TextField("Enter Location", text: $eateries.EateriesLocation)
                .font(.body)
                .scaledToFit()
        TextField("Enter Note", text: $eateries.EateriesNote)
                .padding([.top, .bottom, .trailing])

        TextField("Enter image URL.", text: $eateries.EateriesImage)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        Text("Review")
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .scaledToFit()
                TextField("Enter Review", text: $eateries.EateriesReview)
                 }
              }
         }

      }
    



