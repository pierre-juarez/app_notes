//
//  Home.swift
//  AppNotes
//
//  Created by Pierre Juarez U. on 14/06/23.
//

import SwiftUI

struct Home: View {
    
    @StateObject var model = ViewModel()
    
    var body: some View {
        Button {
            model.show.toggle()
        } label: {
            Text("+ Nueva nota")
        }.sheet(isPresented: $model.show) {
            CreateNote(model: model)
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
