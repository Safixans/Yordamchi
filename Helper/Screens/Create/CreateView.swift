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
                    TextField("Description", text: $viewModel.jobDescription, axis: .vertical)
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
                if !viewModel.isQuickHelp {
                    Section("Aditional Information") {
                        Toggle("Does it have starting date?", isOn: $viewModel.hasStartingDate)
                        if viewModel.hasStartingDate {
                            DatePicker("Specify the starting date", selection: $viewModel.startingDate)
                        }
                        Toggle("Does it have duration?", isOn: $viewModel.hasDuration)
                        if viewModel.hasDuration {
                            TextField("Duration", text: $viewModel.duration)
                                .keyboardType(.numberPad)
                        }
                        Toggle("Do you want to target specific professions?", isOn: $viewModel.hasTags)
                        if viewModel.hasTags {
                            TextField("Separate professions with comma ','", text: $viewModel.tags)
                        }
                        
                    }
                }
            }
            .navigationTitle(viewModel.isQuickHelp ? "Call for Quic Help" : "Post a Job")
        }
    }
}

#Preview {
    CreateView()
}
