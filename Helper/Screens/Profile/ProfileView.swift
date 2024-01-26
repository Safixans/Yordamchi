//
//  ProfileView.swift
//  Helper
//
//  Created by Asror Aliqulov on 23/01/24.
//

import SwiftUI

enum SegmentedRole: String, CaseIterable {
    case asEmployee = "ishchi"
    case asEmployer = "ish beruvchi"
}
enum JobType: String, CaseIterable {
    case post = "ish e'loni"
    case quickHelp = "tezkor yordamchi"
}

struct ProfileView: View {
    @State var profile = mockProfile
    @State var role: SegmentedRole = .asEmployee
    @State var jobType: JobType = .post
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ZStack() {
                        HStack {
                            Spacer()
                            Image("mockPhoto")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 140)
                            Spacer()
                        }
                    }
                }
                .listRowBackground(Color(.clear))
                Section("Shaxsiy Ma'lumotlari") {
                    Label(profile.fullName, systemImage: "person")
                    Label(profile.location, systemImage: "location")
                    Label(profile.phoneNumber, systemImage: "phone")
                }
                Section("Tarix") {
                    Picker("Roli", selection: $role) {
                        ForEach(SegmentedRole.allCases, id: \.rawValue) { role in
                            Text(role.rawValue)
                                .tag(role)
                        }
                    }
                    Picker("Ish turi", selection: $jobType) {
                        ForEach(JobType.allCases, id: \.rawValue) { job in
                            Text(job.rawValue)
                                .tag(job)
                        }
                    }
                    HStack {
                        Text("Bahosi \(role.rawValue) sifatida \(jobType.rawValue) ishi turi uchun")
                        Spacer()
                        Text("3.5")
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                }
                Section {
                    switch role {
                    case .asEmployee:
                        switch jobType {
                        case .post:
                            PostsView()
                        case .quickHelp:
                            QuickHelpsView()
                        }
                    case .asEmployer:
                        switch jobType {
                        case .post:
                            PostsView()
                        case .quickHelp:
                            QuickHelpsView()
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    ProfileView()
}
