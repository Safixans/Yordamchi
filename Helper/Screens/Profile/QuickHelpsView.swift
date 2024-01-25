//
//  QuickHelpsView.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 25/01/24.
//

import SwiftUI

struct QuickHelpsView:View {
    var body: some View {
        ForEach(0..<10) { _ in
            NavigationLink {
                EmptyView()
            } label: {
                VStack(alignment: .leading, spacing: 4) {
                    Text(mockQuicHelp.jobName)
                        .font(.title3)
                        .fontWeight(.semibold)
                    HStack {
                        ForEach(0..<5) { _ in
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
    QuickHelpsView()
}
