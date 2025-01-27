//
//  HomeView.swift
//  Discord
//
//  Created by Apple on 26/01/2025.
//

import SwiftUI

struct HomeView: View {
    @State var showSideMenu = false
    
    var body: some View {
        ZStack{
            
            //menu view
            MenuView()
            //chat view
            ChatView(showSideMenu: $showSideMenu)
                .offset(x:showSideMenu ? 335 : 0)
            //
            Color.black
                .opacity(showSideMenu ? 0.7 : 0)
                .offset(x:showSideMenu ? 335 :0)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showSideMenu = false
                    }
                }
        }
        .toolbar(showSideMenu ? .visible : .hidden, for: .tabBar)
    }
}

#Preview {
    HomeView()
}
