//
//  HomeView.swift
//  ToDoApp
//
//  Created by MacBook Pro on 25/01/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var showSideView = false
    @AppStorage("MenuOverlay") private var isMenuOverlay = true
    
    var body: some View {
        if (isMenuOverlay){
        ZStack{
                ContentView(showSideView: $showSideView)
                SideMenu(showSideView: $showSideView, isMenuOverlay: $isMenuOverlay)
                    .offset(x: showSideView ? 0: -250)
            }
        .animation(.bouncy, value: showSideView)
        }else {
                    ZStack{
                        ContentView(showSideView: $showSideView)
                        SideMenu(showSideView: $showSideView, isMenuOverlay: $isMenuOverlay)
                            .offset(x: -250)
                    }
                    .offset(x: showSideView ? 250 : 0)
                    .animation(.bouncy, value: showSideView)
            }
        

    }
}

#Preview {
    HomeView()
}
