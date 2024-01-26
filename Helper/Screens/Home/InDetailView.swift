//
//  InDetailView.swift
//  Helper
//
//  Created by Asror Aliqulov on 25/01/24.
//

import SwiftUI

enum Focused {
    case wage, metric, reason
}

struct InDetailView: View {
    var post = mockPost
    @State var response = mockResponse
    @FocusState var focus: Focused?
    var body: some View {
        NavigationStack {
            List {
                Section("Ish beruvchi") {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Label("Asror Aliqulov", systemImage: "person.circle")
                    }
                }
                Section("Ish ma'lumotlari") {
                    Text(post.jobName)
                    Text(post.jobDescription)
                }
                Section("Qabul qilingan ishchilar") {
                    HStack {
                        Text("Qolgan o'rinlar soni:")
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
                
                Section("O'z bahoyingizni kiriting") {
                    TextField("Narx", text: $response.wage)
                        .focused($focus, equals: .wage)
                        .onSubmit {
                            focus = .metric
                        }
                    TextField("O'lchov birligi, misol uchun soatiga", text: $response.metric)
                        .focused($focus, equals: .metric)
                        .onSubmit {
                            focus = .reason
                        }
                    TextField("Nima uchun bu narxga ishlashingizni izohlang!", text: $response.reasoning, axis: .vertical)
                        .focused($focus, equals: .reason)
                }
                Button {
                    print(response)
                } label: {
                    Text("Ariza topshirish")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .disabled(response.wage.isEmpty || response.metric.isEmpty)
                .buttonStyle(.borderedProminent)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
            }
        }
    }
}

#Preview {
    InDetailView()
}
