//
//  CreateView.swift
//  Helper
//
//  Created by Asror Aliqulov on 23/01/24.
//

import SwiftUI
import PhotosUI

struct CreateView: View {
    @State var viewModel = CreateViewModel()
    var body: some View {
        NavigationStack {
            Form {
                Toggle("Quick Help", isOn: $viewModel.isQuickHelp)
                
                Section("Name") {
                    TextField("Job Name", text: $viewModel.jobName)
                    TextField("Number of necessary poeple", text: $viewModel.necessaryPeople)
                        .keyboardType(.numberPad)
                }
                Section("Description") {
                    TextEditor(text: $viewModel.jobDescription)
                }
                Section("Photos") {
                    PhotosPicker("Choose Relevant Photos", selection: $viewModel.relevantPhotos)
                    if !viewModel.selectedImages.isEmpty {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<viewModel.selectedImages.count, id: \.self) { index in
                                    viewModel.selectedImages[index]
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Create a Job")
            .onChange(of: viewModel.relevantPhotos) {
                Task {
                    viewModel.selectedImages.removeAll()
                    
                    for item in viewModel.relevantPhotos {
                        if let image = try? await item.loadTransferable(type: Image.self) {
                            viewModel.selectedImages.append(image)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CreateView()
}
