//
//  CreateNote.swift
//  AppNotes
//
//  Created by Pierre Juarez U. on 14/06/23.
//

import SwiftUI

struct CreateNote: View {
    
    @ObservedObject var model: ViewModel
    
    var body: some View {
        VStack{
            Text("Agregar nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.nota)
            Divider()
            DatePicker("Seleccione fecha", selection: $model.createdAt)
            Spacer()
            Button {
                
            } label: {
                Label {
                    Text("Guardar").foregroundColor(.white).bold()
                } icon: {
                    Image(systemName: "plus").foregroundColor(.white)
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(Color.blue)
            .cornerRadius(8)
            
        }.padding()
    }
}
