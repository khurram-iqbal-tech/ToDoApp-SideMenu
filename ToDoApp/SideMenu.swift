//
//  SideMenu.swift
//  ToDoApp
//
//  Created by MacBook Pro on 25/01/2025.
//

import SwiftUI

struct SideMenu: View {
    @AppStorage("NoteAppMode") private var isDarkMode = true
    @Binding var showSideView: Bool
    @Binding var isMenuOverlay: Bool
    
    var body: some View {
        VStack(spacing: 19){
            Button{
                showSideView.toggle()
            } label: {
                Image(systemName: "arrowshape.left.circle.fill")
                    .font(.largeTitle)
                    .padding(.bottom)
                    .tint(.primary)
            }
            
            Text("Note App")
                .font(.title)
            Toggle(isOn: $isDarkMode) {
                Text("Dark Mode")
            }
            .padding(8)
            .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 5))
            .frame(width: 188)
            
            Toggle(isOn: $isMenuOverlay){
                Text("Menu Overlay")
            }
            .padding(8)
            .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 8))
            Spacer()
            
        }
        .padding()
        .frame(width: 250)
        .background(.ultraThinMaterial)
        .frame(maxWidth: .infinity, alignment: .leading)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    SideMenu(showSideView: .constant(false), isMenuOverlay: .constant(true))
}
