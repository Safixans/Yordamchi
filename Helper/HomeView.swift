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
            Text("Home View")
            ScrollView {
                VStack {
                    ForEach(0..<19) { _ in
                        PostCardView()
                    }
                }
            }
            .padding(.horizontal)
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

struct PostCardView: View {
    @State private var postCardState: CardState = .compact
    var body: some View {
        VStack {
            switch postCardState {
            case .compact:
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Title")
                                .font(.title2)
                            Label("Tashkent, Chilanzar", systemImage: "location")
                                .foregroundStyle(.gray)
                            
                        }
                        Spacer()
                        Circle()
                            .frame(width: 60, height: 60)
                    }
                }
                .padding()
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .onTapGesture {
                    withAnimation {
                        postCardState = .expanded
                    }
                }
            case .expanded:
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Title")
                                .font(.title2)
                            Label("Tashkent, Chilanzar", systemImage: "location")
                                .foregroundStyle(.gray)
                            
                        }
                        Spacer()
                        Circle()
                            .frame(width: 60, height: 60)
                    }
                }
                .frame(height: 200)
                .padding()
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .onTapGesture {
                    withAnimation {
                        postCardState = .compact
                    }
                }
            }
        }
    }
}
    
    #Preview {
        HomeView()
    }
