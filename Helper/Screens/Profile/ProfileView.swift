//
//  ProfileView.swift
//  Helper
//
//  Created by Asror Aliqulov on 23/01/24.
//

import SwiftUI

enum SegmentedRole: String, CaseIterable {
    case asEmployee = "As Employee"
    case asEmployer = "As Employer"
}
enum JobType: String, CaseIterable {
    case post = "Post"
    case quickHelp = "Quick Help"
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
                Section("Personal Information") {
                    Label(profile.fullName, systemImage: "person")
                    Label(profile.location, systemImage: "location")
                    Label(profile.phoneNumber, systemImage: "phone")
                }
                Section("History") {
                    Picker("Role", selection: $role) {
                        ForEach(SegmentedRole.allCases, id: \.rawValue) { role in
                            Text(role.rawValue)
                                .tag(role)
                        }
                    }
                    Picker("Job Type", selection: $jobType) {
                        ForEach(JobType.allCases, id: \.rawValue) { job in
                            Text(job.rawValue)
                                .tag(job)
                        }
                    }
                }
                Section {
                    switch role {
                    case .asEmployee:
                        switch jobType {
                        case .post:
                            posts
                        case .quickHelp:
                            quickHelps
                        }
                    case .asEmployer:
                        switch jobType {
                        case .post:
                            posts
                        case .quickHelp:
                            quickHelps
                        }
                    }
                }
            }
        }
    }
    var posts: some View {
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
    var quickHelps: some View {
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
    ProfileView()
}
