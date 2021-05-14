//
//  MasterView.swift
//  Ecoredata
//
//  Created by Weiye Zhou on 14/5/21.
//

import SwiftUI

struct MasterView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var eaterieslist: EateriesList
    @Environment(\.editMode) var editMode
    
    var body: some View{
        VStack{
            if editMode?.wrappedValue == .active {
                HStack{
                    Text("📝").font(Font.system(.largeTitle).bold())
                    TextField("enter title", text: $eaterieslist.titleString).font(Font.system(.largeTitle).bold())
                }
            }
            
        List {
            ForEach(eaterieslist.eateriesArray) { eat in
                NavigationLink(
                    destination: DetailView(eateries: eat),
                    label:{
                        RowView(eateries: eat)
                    })
                
            }
            .onDelete { offsets in
                withAnimation { eaterieslist.deleteItems(offsets: offsets) }
            }
            .onMove(perform: onMove)
        }.navigationBarItems(leading: EditButton(), trailing: Button(action: {
            withAnimation{
            eaterieslist.addItem()
            }
        }) {
            Label("", systemImage: "plus")
        })
    } .navigationBarTitle(editMode?.wrappedValue == .active ? "" : eaterieslist.title ?? "The Best Eateries:")
    }
    private func onMove(source: IndexSet, destination: Int) {
        self.eaterieslist.eateriesArray.move(fromOffsets: source, toOffset: destination)
    }
}
