//
//  ContentView.swift
//  ToDoApp
//
//  Created by MacBook Pro on 23/01/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Binding var showSideView: Bool
    @State private var showAddView = false
    @Query var notes:[Note]
    
    var body: some View {
        VStack(alignment: .leading){
            TopView(showSideView: $showSideView)
            
            noteCell(note: Note.sample)
            List{
                ForEach(notes){ note in
                    noteCell(note: note)
                        .onTapGesture {
                            noteCompleteToggle(note: note)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button{
                                withAnimation{
                                    noteDelete(note: note)
                                }
                            } label:{
                                Image(systemName: "trash")
                            }
                        }
                }
            }
            .listRowSeparator(.hidden)
            Spacer()
        }
        .overlay(alignment: .bottomTrailing){
            Button{
                showAddView = true
            } label: {
                Image(systemName: "plus")
                    .padding(20)
                    .background(.ultraThinMaterial, in: Circle())
                    
            }
            .padding(.trailing)
            .tint(.primary)
            
        }
       //
        .sheet(isPresented: $showAddView) {
            AddNoteView()
        }
        
    }
    
    func noteCompleteToggle(note: Note){
        note.isComplete.toggle()
        do{
            try context.save()
        }catch{
            print("Error in Save Complete Toggle: \(error.localizedDescription)")
        }
    }
    
    func noteDelete(note: Note){
        context.delete(note)
        do{
            try context.save()
        }catch{
            print("Error in Deleting Note: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView(showSideView: .constant(false))
        .modelContainer(for: [Note.self])
}

struct TopView: View {
    @Binding var showSideView: Bool
    
    var body: some View {
        VStack(spacing: 8){
            Button{
                showSideView.toggle()
            } label: {
                Image(systemName: "lines.measurement.vertical")
                    .font(.title)
                    .bold()
                    .tint(.primary)
            }
            Text("Notes")
                .font(.largeTitle)
                .bold()
            
        }
        
        .frame(maxWidth: .infinity, alignment: .leading)
        //.background(.brown)
        .padding()
    }
}

struct noteCell: View {
    let note: Note
    
    var body: some View {
        HStack{
            Image(systemName: note.icon)
                .renderingMode(note.iconColor ? .original : .template)
                .frame(width: 40, alignment: .leading)
            Text(note.title)
                .strikethrough(note.isComplete, color: .primary)
            Spacer()
            Image(systemName: note.isComplete ? "checkmark.circle.fill" : "circle")
        }
        .padding(.horizontal)
        .padding(.horizontal)
    }
}

