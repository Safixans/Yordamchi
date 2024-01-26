//
//  HelperTabView.swift
//  Helper
//
//  Created by Asror Aliqulov on 23/01/24.
//

import SwiftUI

enum Tab {
    case home
    case search
    case create
    case chat
    case library
}

struct HelperTabView: View {
    @State private var currentTab: Tab = .home
    var body: some View {
        TabView(selection: $currentTab) {
            HomeView()
                .tabItem { Label("Asosiy", systemImage: "house") }
                .tag(Tab.home)
            SearchView()
                .tabItem { Label("Qidirish", systemImage: "magnifyingglass") }
                .tag(Tab.search)
            CreateView()
                .tabItem { Label("Qo'shish", systemImage: "plus.circle") }
                .tag(Tab.create)
            ChatView()
                .tabItem { Label("Xabarlar", systemImage: "message") }
                .tag(Tab.chat)
            LibraryView()
                .tabItem { Label("Resurslar", systemImage: "mail.stack") }
                .tag(Tab.library)
            
        }
    }
}

#Preview {
    HelperTabView()
}
