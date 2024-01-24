//
//  Data.swift
//  Helper
//
//  Created by Asror Aliqulov on 24/01/24.
//

import Foundation

//MARK: - structs

struct Profile: Codable {
    var id: String
    
    var profilePhoto: Data?
    var fullName: String
    var location: String
    var phoneNumber: String
    var role: [Role]
}

struct Post: Codable {
    var id: String
    var creatorId: String
    
    var postPrivacyLevel: PostPrivacyLevel
    var jobName: String
    var jobDescription: String
    var tags: [String]?
    var startingDate: Date?
    var approximateDuration: Int?
    var numberOfPeopleNeeded: Int?
    var relevantImages: [Data]?
    var postStatus: PostStatus
}

struct EmployeeResponse: Codable {
    var id: String
    var postId: String
    
    var wage: Double
    var metric: String
    var reasoning: String?
}

struct QuickHelp: Codable {
    var id: String
    var creatorId: String
    
    var jobName: String
    var jobDesription: String
    var numberOfPeopleNeeded: Int
    var hourlyWage: Double
    var review: [Review]?
}

struct Review: Codable {
    var id: String
    var creatorId: String
    var to: String
    
    var stars: Int
    var comment: String?
    var relevantImages: [Data]?
}

//MARK: - enums

enum Role: Codable {
    case employer(
        rating: Double?,
        posts: [Post]?,
        quickHelpers: [QuickHelp]?
    )
    case employee(
        currentStatus: EmployeeStatus,
        rating: Double?,
        abilities: [String]?,
        completedJobs: [Post]?,
        completedQuickHelps: [QuickHelp]?
    )
}

enum PostStatus: Codable {
    case searching(appliedPeople: [Profile]?, acceptedPeople: [Profile]?)
    case ongoing(workingPeople: [Profile]?)
    case finished(workedPeople: [Profile]?, reviews: [Review]?)
}

enum PostPrivacyLevel: String, Codable {
    case `private`
    case `public`
}
enum EmployeeStatus: Codable {
    case working(currentWork: Post)
    case busy
    case free
}





