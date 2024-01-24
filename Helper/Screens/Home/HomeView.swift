//
//  HomeView.swift
//  Helper
//
//  Created by Asror Aliqulov on 23/01/24.
//

import SwiftUI

enum CardState {
    case compact
    case expanded
}

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<19) { number in
                    HStack {
                        Circle()
                            .frame(width: 60)
                        Text("\(number)")
                    }
                }
            }
            .navigationTitle("Helper")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        ProfileView()
                            .toolbar(.hidden, for: .tabBar)
                    } label: {
                        Image(systemName: "person.circle")
                    }
                }
            }
        }
    }
        
}


    
#Preview {
    HomeView()
}
