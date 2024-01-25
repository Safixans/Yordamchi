//
//  InDetailView.swift
//  Helper
//
//  Created by Asror Aliqulov on 25/01/24.
//

import SwiftUI

struct InDetailView: View {
    var post = mockPost
    @State var response = mockResponse
    var body: some View {
        NavigationStack {
            List {
                Section("Creator") {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Label("Asror Aliqulov", systemImage: "person.circle")
                    }
                }
                Section("Job Information") {
                    Text(post.jobName)
                    Text(post.jobDescription)
                }
                Section("Accepted People") {
                    HStack {
                        Text("Spots left:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("3")
                            .fontWeight(.semibold)
                    }
                    ForEach(0..<5, id: \.self) { _ in
                        NavigationLink {
                            ProfileView()
                        } label: {
                            Label("Asror Aliqulov", systemImage: "person")
                        }
                    }
                    
                }
                
                Section("Enter Your Offer") {
                    TextField("Price", text: $response.wage)
                    TextField("Enter your metric such as square meter or for whole job", text: $response.metric)
                    TextField("Explain why!", text: $response.reasoning, axis: .vertical)
                }
                Button {
                    print(response)
                } label: {
                    Text("Apply")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .disabled(response.wage.isEmpty || response.metric.isEmpty)
                .buttonStyle(.borderedProminent)
                .listRowBackground(Color.clear)
            }
        }
    }
}

#Preview {
    InDetailView()
}
