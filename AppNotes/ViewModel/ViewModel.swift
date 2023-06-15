//
//  ViewModel.swift
//  AppNotes
//
//  Created by Pierre Juarez U. on 29/05/23.
//

import Foundation
import CoreData
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var nota = ""
    @Published var createdAt = Date()
    @Published var show = false
    @Published var updateItem : Notes!
    
    func saveData(context: NSManagedObjectContext){
        let newNote = Notes(context: context)
        newNote.createdAt = createdAt
        newNote.notes = nota
        
        do {
            try context.save()
            print("Se guardó la nota!")
            show.toggle()
        } catch let error as NSError {
            print("Error al guardar: \(error.localizedDescription)")
        }
        
    }
    
    func deleteData(item: Notes, context: NSManagedObjectContext){
        context.delete(item)
        do {
            try context.save()
            print("Se eliminó correctamente!")
        } catch let error as NSError {
            print("Error al eliminar: \(error.localizedDescription)")
        }
    }
    
    func sendData(item: Notes){
        updateItem = item
        nota = item.notes ?? ""
        createdAt = item.createdAt ?? Date()
        show.toggle()
        
    }
    
    func editData(context: NSManagedObjectContext){
        updateItem.createdAt = createdAt
        updateItem.notes = nota
        do {
            try context.save()
            print("Nota editada correctamente!")
            show.toggle()
        } catch let error as NSError {
            print("Error al editar: \(error.localizedDescription)")
        }
    }
    
}
