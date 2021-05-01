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
    
     var body: some View {
        NavigationView {
            MasterView(eatery: eateries)
                .navigationBarTitle(Text("The Best Eateries"))
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
        return ContentView(eateries: ViewModel())
    }
}
