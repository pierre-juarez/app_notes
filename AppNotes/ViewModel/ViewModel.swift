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
    
}
