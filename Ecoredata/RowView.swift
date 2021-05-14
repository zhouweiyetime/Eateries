//
//  RowView.swift
//  Ecoredata
//
//  Created by Weiye Zhou on 14/5/21.
//

import SwiftUI

struct RowView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var eateries: Eateries
    let eateriesviewmodel = EateriesViewModel()
    
    var body: some View {
        eateriesviewmodel.download(eateries.imageString).resizable().frame(width: 80, height: 80)
        VStack(alignment: .leading) {
            Text(eateries.nameString)
            .font(.headline)
            .fontWeight(.bold)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .scaledToFit()
            Text(eateries.locationString)
            .font(.headline)
            .fontWeight(.bold)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .scaledToFit()
        }
}
}
