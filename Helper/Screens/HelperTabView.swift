//
//  HelperTabView.swift
//  Helper
//
//  Created by Asror Aliqulov on 23/01/24.
//

import SwiftUI



struct HelperTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            CreateView()
                .tabItem { Label("Create", systemImage: "plus.circle") }
            ChatView()
                .tabItem { Label("Chat", systemImage: "message") }
            LibraryView()
                .tabItem { Label("Library", systemImage: "mail.stack") }
            
        }
    }
}

#Preview {
    HelperTabView()
}
