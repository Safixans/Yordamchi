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
    @FocusState var focus: CreateViewModel.Field?
    var body: some View {
        NavigationStack {
            Form {
                Toggle("Quick Help", isOn: $viewModel.isQuickHelp)
                
                Section("Name") {
                    TextField("Job Name", text: $viewModel.jobName)
                        .focused($focus, equals: .jobName)
                        .onSubmit {
                            focus = .necessaryPeople
                        }
                    
                    TextField("Number of necessary poeple", text: $viewModel.necessaryPeople)
                        .keyboardType(.numberPad)
                        .focused($focus, equals: .necessaryPeople)
                        .onSubmit {
                            focus = .jobDescription
                        }
                }
                Section("Description") {
                    TextField("Description", text: $viewModel.jobDescription, axis: .vertical)
                        .focused($focus, equals: .jobDescription)
                        .onSubmit {
                            focus = .relevantPhotos
                        }
                }
                Section("Photos") {
                    PhotosPicker("Choose Relevant Photos", selection: $viewModel.relevantPhotos)
                        .focused($focus, equals: .relevantPhotos)
                        .onSubmit {
                            if viewModel.hasStartingDate {
                                focus = .startingDate
                            } else if viewModel.hasDuration {
                                focus = .duration
                            } else if viewModel.hasTags {
                                focus = .tags
                            } else {
                                print("Ready to submit")
                            }
                        }
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
                            .onChange(of: viewModel.hasStartingDate) {
                                if viewModel.hasStartingDate {
                                    focus = .startingDate
                                }
                            }
                        if viewModel.hasStartingDate {
                            DatePicker(
                                "Specify the starting date",
                                selection: $viewModel.startingDate,
                                in: Date.now...,
                                displayedComponents: .date
                            )
                                .focused($focus, equals: .startingDate)
                                
                        }
                        Toggle("Does it have duration?", isOn: $viewModel.hasDuration)
                            .onChange(of: viewModel.hasDuration) {
                                if viewModel.hasDuration {
                                    focus = .duration
                                }
                            }
                        if viewModel.hasDuration {
                            TextField("Duration", text: $viewModel.duration)
                                .keyboardType(.numberPad)
                                .focused($focus, equals: .duration)
                        }
                        Toggle("Do you want to target specific professions?", isOn: $viewModel.hasTags)
                            .onChange(of: viewModel.hasTags) {
                                if viewModel.hasTags {
                                    focus = .tags
                                }
                            }
                        if viewModel.hasTags {
                            TextField("Separate professions with comma ','", text: $viewModel.tags)
                                .focused($focus, equals: .tags)
                        }
                        
                    }
                }
                Button{
                    
                } label: {
                    Text("Apply")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(viewModel.canSubmit)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
            }
            .navigationTitle(viewModel.isQuickHelp ? "Call for Quic Help" : "Post a Job")
        }
    }
}

#Preview {
    CreateView()
}
