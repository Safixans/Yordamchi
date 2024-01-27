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
    
    var profilePhoto: String?
    var fullName: String
    var bio: String
    var location: String
    var phoneNumber: String
    var role: Role
}

struct Post: Codable {
    var id: String
    var creatorId: String
    
    var postPrivacyLevel: PostPrivacyLevel
    var jobName: String
    var jobDescription: String
    var jobLocation: String
    var tags: [String]?
    var startingDate: Date?
    var approximateDuration: Int?
    var numberOfPeopleNeeded: Int?
    var relevantImages: [String]?
    var postStatus: PostStatus
}

struct EmployeeResponse: Codable {
    var id: String
    var postId: String
    
    var wage: String
    var metric: String
    var reasoning: String
}

struct QuickHelp: Codable {
    var id: String
    var creatorId: String
    
    var jobName: String
    var jobDesription: String
    var numberOfPeopleNeeded: String
    var hourlyWage: String
    var review: [Review]?
}

struct Review: Codable {
    var id: String
    var creatorId: String
    var to: String
    
    var stars: Int
    var comment: String?
    var relevantImages: [String]?
}

//MARK: - enums

enum Role: Codable {
   case employer(
        rating: Double?,
        postsIds: [String]?,
        quickHelpersIds: [String]?
    )
    case employee(
        currentStatus: EmployeeStatus,
        rating: Double?,
        abilities: [String]?,
        completedJobsIds: [String]?,
        completedQuickHelpsIds: [String]?
    )
}

enum PostStatus: Codable {
    case searching(appliedPeopleIds: [String]?, acceptedPeopleIds: [String]?)
    case ongoing(workingPeopleIds: [String]?)
    case finished(workedPeopleIds: [String]?, reviewsIds: [String]?)
}

enum PostPrivacyLevel: String, Codable, CaseIterable {
    case `private`
    case `public`
}
enum EmployeeStatus: Codable {
    case working(currentWorksId: String)
    case busy
    case free
}





