//
//  AddNoteView.swift
//  ToDoApp
//
//  Created by MacBook Pro on 25/01/2025.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 20){
            Button{
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .padding(2)
                    .background(.ultraThickMaterial)
                    .tint(.primary)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            TextField("Enter the note...", text: $text)
                .padding()
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                .font(.title)
            Button{
                onSave()
            } label: {
                Text("Save")
                    .padding()
                    .background(.green, in: RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(.white)
                    .bold()
                
            }
            
        }
        .padding()
        Spacer()
    }
    
    func onSave(){
        let newNote = Note(icon: "", title: text, isComplete: false, iconColor: false)
        context.insert(newNote)
        do{
            try context.save()
        }catch{
            print("Error in Save New Note: \(error.localizedDescription)")
        }
        dismiss()
    }
}

#Preview {
    AddNoteView()
}
