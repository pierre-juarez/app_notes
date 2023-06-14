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
    
}
