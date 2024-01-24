//
//  Data.swift
//  Helper
//
//  Created by Asror Aliqulov on 24/01/24.
//

import Foundation

struct Profile: Codable {
    var profilePhoto: Data
    var fullName: String
    var location: String
    var phoneNumber: String
    var role: Role
}

enum Role: Codable {
    case employer(
        rating: Double,
        posts: [Post],
        quickHelpers: [QuickHelp]
    )
    case employee(
        rating: Double,
        abilities: [String],
        completedJobs: [Post],
        completedQuickHelps: [QuickHelp],
        currentStatus: EmployeeStatus
    )
}

enum EmployeeStatus: Codable {
    case working(currentWork: Post)
    case busy
    case free
}

struct Review: Codable {
    var stars: Int
    var comment: String
    var relevantImages: [Data]?
}

struct QuickHelp: Codable {
    var jobName: String
    var jobDesription: String
    var numberOfPeopleNeeded: Int
    var hourlyWage: Double
    var review: Review?
}

struct Post: Codable {
    var postPrivacyLevel: PostPrivacyLevel
    var jobName: String
    var jobDescription: String
    var tags: [String]?
    var startingDate: Date
    var approximateDuration: ApproximateDuration
    var numberOfPeopleNeeded: NeededPeople
    var relevantImages: [Data]?
    var review: Review?
    var postStatus: PostStatus
}

enum PostStatus: String, Codable {
    case notStarted
    case ongoing
    case finished
}

enum PostPrivacyLevel: String, Codable {
    case `private`
    case `public`
}
enum ApproximateDuration: Codable {
    case approximate(days: Int)
    case undefined
}
enum NeededPeople: Codable {
    case exact(numberOfPeople: Int)
    case undefined
}






