//
//  ViewModel.swift
//  Helper
//
//  Created by Asror Aliqulov on 24/01/24.
//

import SwiftUI

@Observable
class ViewModel {
    var profile: Profile
    init(profile: Profile) {
        self.profile = profile
    }
}

let mockProfile = Profile(
    id: String(UUID().uuidString),
    fullName: "Asror Aliqulov",
    location: "Tashkent, Yangi Hayot",
    phoneNumber: "888888888",
    role: [.employee(
        currentStatus: .free,
        rating: nil,
        abilities: ["Swift", "SwiftUI", "SwiftData", "Mobile Design", "Figma"],
        completedJobs: nil,
        completedQuickHelps: nil
    )]
)

let mockPost = Post(
    id: String(UUID().uuidString),
    creatorId: mockProfile.id,
    postPrivacyLevel: .public,
    jobName: "Java Backend",
    jobDescription: "I need a backend Developer to handle all the backend stuff for me. These are the following that should be done by backend developer: create a sophisticated database for this app, create a cloud and run that database in that cloud, Create an API to use the databse with this app, make sure the images are not loaded on main thread to prevent the from crashing",
    numberOfPeopleNeeded: 2,
    postStatus: .searching(appliedPeople: [mockProfile], acceptedPeople: nil)
)

let mockQuicHelp = QuickHelp(
    id: String(UUID().uuidString),
    creatorId: mockProfile.id,
    jobName: "Need to carry bed to 5th floor",
    jobDesription: "I got 2 level bed, i need 4 people to carry it to the 4th floor via stairs. ",
    numberOfPeopleNeeded: 4,
    hourlyWage: 30000
)

let mockReview = Review(
    id: String(UUID().uuidString),
    creatorId: mockProfile.id,
    to: mockPost.id,
    stars: 4,
    comment: "The work was good. They payed well. Keep Going and Thanks!"
)

let mockResponse = EmployeeResponse(
    id: String(UUID().uuidString),
    postId: mockPost.id,
    wage: 500000,
    metric: "hour",
    reasoning: "The job is very hard and 2 people might strucle to compelete it. If you don't want to increase the number of people this is my price for this job."
)