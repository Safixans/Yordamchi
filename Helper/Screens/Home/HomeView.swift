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
    @State var searchTerm = ""
    var body: some View {
        NavigationStack {
            List {
                Section("Bo'sh ish e'lonlari") {
                    ForEach(0..<19) { number in
                        NavigationLink {
                            InDetailView()
                        } label: {
                            VStack(alignment: .leading) {
                                Text(mockPost.jobName)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Text(mockPost.jobLocation)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Yordamchi")
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
