//
//  PostsView.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 25/01/24.
//

import SwiftUI

struct PostsView:View {
    var body: some View {
        ForEach(0..<10) { _ in
            NavigationLink {
                EmptyView()
            } label: {
                VStack(alignment: .leading, spacing: 4) {
                    Text(mockPost.jobName)
                        .font(.title3)
                        .fontWeight(.semibold)
                    HStack {
                        ForEach(0..<4) { _ in
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PostsView()
}
