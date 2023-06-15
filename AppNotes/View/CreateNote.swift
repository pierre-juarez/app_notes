//
//  CreateNote.swift
//  AppNotes
//
//  Created by Pierre Juarez U. on 14/06/23.
//

import SwiftUI

struct CreateNote: View {
    
    @ObservedObject var model: ViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack{
            Text(model.updateItem != nil ? "Editar nota" : "Agregar nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.nota)
            Divider()
            DatePicker("Seleccione fecha", selection: $model.createdAt)
            Spacer()
            Button {
                if model.updateItem != nil{
                    model.editData(context: context)
                }else{
                    model.saveData(context: context)
                }
            } label: {
                Label {
                    Text(model.updateItem != nil ? "Editar" : "Guardar").foregroundColor(.white).bold()
                } icon: {
                    Image(systemName: "plus").foregroundColor(.white)
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(model.nota == "" ? Color.gray : (model.updateItem != nil) ? Color.yellow : Color.blue)
            .cornerRadius(8)
            .disabled(model.nota == "" ? true : false)
            
        }.padding()
    }
}
