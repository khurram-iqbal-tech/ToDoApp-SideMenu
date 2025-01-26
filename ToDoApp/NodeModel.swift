//
//  NodeModel.swift
//  ToDoApp
//
//  Created by MacBook Pro on 23/01/2025.
//

import Foundation
import SwiftData

@Model
class Note: Identifiable{
    var id = UUID()
    var icon: String
    var title: String
    var isComplete: Bool
    var iconColor: Bool
    
    init(id: UUID = UUID(), icon: String, title: String, isComplete: Bool, iconColor: Bool) {
        self.id = id
        self.icon = icon
        self.title = title
        self.isComplete = isComplete
        self.iconColor = iconColor
    }
    
    static let sample = Note(icon: "pencil", title: "Swift UI", isComplete: true, iconColor: true)
}
