//
//  MasterView.swift
//  Eateries
//
//  Created by Weiye Zhou on 29/4/21.
//

import Foundation
import SwiftUI

struct MasterView: View {
    //set instance for ViewModel
    @ObservedObject var eatery: ViewModel
    @Binding var title: String
    let eateriesviewmodel = EateriesViewModel()
    @Environment(\.editMode) var editMode
    
    
    var body: some View {
        VStack{
            //if the edit mode is on, show the editable textfield
            if editMode?.wrappedValue == .active {
                HStack{
                    Text("📝").font(Font.system(.largeTitle).bold())
                    TextField("enter title", text: $title).font(Font.system(.largeTitle).bold())
                }
            }
        List{
            ForEach(eatery.model, id: \.EateriesName) {eateries in
                NavigationLink(
                    destination: DetailView(eateries: eateries).frame(width: UIScreen.main.bounds.width - 30),
                    label: {
                        eateriesviewmodel.download(eateries.EateriesImage).resizable().frame(width: 80, height: 80)
                        VStack(alignment: .leading) {                        Text("\(editMode?.wrappedValue.isEditing ?? false ? "Edit " : "") \(eateries.EateriesName)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .scaledToFit()
                            Text("\(editMode?.wrappedValue.isEditing ?? false ? "Edit " : "") \(eateries.EateriesLocation)")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .scaledToFit()
                        }})
            }
            .onDelete(perform: deleteItems)
            .onMove(perform: moveItems)
        }
        }.navigationBarTitle(editMode?.wrappedValue == .active ? "" : title)}
// create delete item function
    func deleteItems(at offsets: IndexSet) {
        eatery.remove(at: offsets)
    }
    
// create move item function
    func moveItems(source: IndexSet, destination: Int) {
        eatery.model.move(fromOffsets: source, toOffset: destination)
    }
    
}



