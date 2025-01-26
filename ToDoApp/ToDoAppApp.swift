//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by MacBook Pro on 23/01/2025.
//

import SwiftUI
import SwiftData

@main
struct ToDoAppApp: App {
    @Environment(\.modelContext) var modelContext
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: [Note.self])
                
        }
    }
}
