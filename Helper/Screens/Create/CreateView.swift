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
                Toggle("Tezkor Yordamchi", isOn: $viewModel.isQuickHelp)
                
                Section("Nomi") {
                    TextField("Ish nomi", text: $viewModel.jobName)
                        .focused($focus, equals: .jobName)
                        .onSubmit {
                            focus = .necessaryPeople
                        }
                    
                    TextField("Kerakli ishchilar soni", text: $viewModel.necessaryPeople)
                        .keyboardType(.numberPad)
                        .focused($focus, equals: .necessaryPeople)
                        .onSubmit {
                            focus = .jobDescription
                        }
                }
                Section("Izoh") {
                    TextField("Ish haqida ma'lumot", text: $viewModel.jobDescription, axis: .vertical)
                        .focused($focus, equals: .jobDescription)
                        .onSubmit {
                            focus = .relevantPhotos
                        }
                }
                if !viewModel.isQuickHelp {
                    Section("Qo'shimcha ma'lumotlar") {
                        Toggle("Boshlanish vaqti ma'lummi?", isOn: $viewModel.hasStartingDate)
                            .onChange(of: viewModel.hasStartingDate) {
                                if viewModel.hasStartingDate {
                                    focus = .startingDate
                                }
                            }
                        if viewModel.hasStartingDate {
                            DatePicker(
                                "Boshlanish vaqti",
                                selection: $viewModel.startingDate,
                                in: Date.now...,
                                displayedComponents: .date
                            )
                                .focused($focus, equals: .startingDate)
                                
                        }
                        Toggle("Necha kun davom etishi aniqmi?", isOn: $viewModel.hasDuration)
                            .onChange(of: viewModel.hasDuration) {
                                if viewModel.hasDuration {
                                    focus = .duration
                                }
                            }
                        if viewModel.hasDuration {
                            TextField("Davomiyligi", text: $viewModel.duration)
                                .keyboardType(.numberPad)
                                .focused($focus, equals: .duration)
                        }
                        Toggle("Ma'lum bir kasb egalarini qamrab olishni istaysizmi?", isOn: $viewModel.hasTags)
                            .onChange(of: viewModel.hasTags) {
                                if viewModel.hasTags {
                                    focus = .tags
                                }
                            }
                        if viewModel.hasTags {
                            TextField("Vergul bilan ajratib yozing ','", text: $viewModel.tags)
                                .focused($focus, equals: .tags)
                        }
                        
                    }
                }
                Button{
                    
                } label: {
                    Text("E'lon qilish")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(viewModel.canSubmit)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
            }
            .navigationTitle(viewModel.isQuickHelp ? "Tezkor Yordamchi" : "An'anaviy Ish")
        }
    }
}

#Preview {
    CreateView()
}
