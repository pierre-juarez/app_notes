//
//  AppNotesApp.swift
//  AppNotes
//
//  Created by Pierre Juarez U. on 29/05/23.
//

import SwiftUI

@main
struct AppNotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
