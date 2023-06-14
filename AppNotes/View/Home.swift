//
//  Home.swift
//  AppNotes
//
//  Created by Pierre Juarez U. on 14/06/23.
//

import SwiftUI

struct Home: View {
    
    @StateObject var model = ViewModel()
    @FetchRequest(entity: Notes.entity(), sortDescriptors: [NSSortDescriptor(key: "createdAt", ascending: true)], animation: .spring()) var results: FetchedResults<Notes>
    
    var body: some View {
        
        NavigationView {
            List{
                
                ForEach(results){ item in
                    VStack(alignment: .leading){
                        Text(item.notes ?? "Sin nota")
                            .font(.title)
                            .bold()
                        Text(item.createdAt ?? Date(), style: .date)
                    }
                }
                
            }.navigationTitle("Lista de Notas")
                .navigationBarItems(trailing: Button(action: {
                    model.show.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                        .font(.title)
                }))
                .sheet(isPresented: $model.show) {
                    CreateNote(model: model)
                }
        }

    }
}

