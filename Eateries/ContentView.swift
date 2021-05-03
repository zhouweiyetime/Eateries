//
//  ContentView.swift
//  Eateries
//
//  Created by Weiye Zhou on 29/4/21.
//

import SwiftUI

// create Edit Button and Add Button
struct ContentView: View {
    @ObservedObject var eateries: ViewModel
    @Binding var eateries: 
     var body: some View {
        NavigationView {
            MasterView(eatery: eateries)
                .navigationBarItems(leading:
                        EditButton(),trailing:
                        Button(action: {
                            withAnimation {
                            eateries.addElement()
                            }
                        }) {
                            Image(systemName: "plus")
                        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(eateries: Binding(get: {
            EateriesApp.Model
        }, set: { newValue in
            EateriesApp.Model = newValue
        }))
    }
}
