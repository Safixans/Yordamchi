//
//  CreateView.swift
//  Helper
//
//  Created by Asror Aliqulov on 23/01/24.
//

import SwiftUI
import PhotosUI

struct CreateView: View {
    @State var isQuickHelp = true
    @State var jobName = ""
    @State var jobDescription = ""
    @State var relevantPhotos = [PhotosPickerItem]()
    @State var selectedImages = [Image]()
    @State var necessaryPeople = ""
    var body: some View {
        NavigationStack {
            Form {
                Toggle("Quick Help", isOn: $isQuickHelp)
                
                Section("Name") {
                    TextField("Job Name", text: $jobName)
                    TextField("Number of necessary poeple", text: $necessaryPeople)
                        .keyboardType(.numberPad)
                }
                Section("Description") {
                    TextEditor(text: $jobDescription)
                }
                Section("Photos") {
                    PhotosPicker("Choose Relevant Photos", selection: $relevantPhotos)
                    if !selectedImages.isEmpty {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<selectedImages.count, id: \.self) { index in
                                    selectedImages[index]
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
            .onChange(of: relevantPhotos) {
                Task {
                    selectedImages.removeAll()
                    
                    for item in relevantPhotos {
                        if let image = try? await item.loadTransferable(type: Image.self) {
                            selectedImages.append(image)
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
