//
//  MockData.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 25/01/24.
//

import Foundation
let mockProfile = Profile(
    id: String(UUID().uuidString),
    fullName: "Asror Aliqulov",
    location: "Toshkent, Yangi Hayot",
    phoneNumber: "888888888",
    role: .employee(
        currentStatus: .free,
        rating: nil,
        abilities: ["Swift", "SwiftUI", "SwiftData", "Mobile Design", "Figma"],
        completedJobsIds: nil,
        completedQuickHelpsIds: nil
    )
)

let mockPost = Post(
    id: String(UUID().uuidString),
    creatorId: mockProfile.id,
    postPrivacyLevel: .public,
    jobName: "Java Backend Developer kerak",
    jobDescription: "Menga backend Developer kerak bo'lib, men uchun barcha ma'lumotlarni qayta ishlaydi. Bular backend ishlab chiqaruvchisi tomonidan bajarilishi kerak bo'lgan ishlar: ushbu ilova uchun murakkab ma'lumotlar bazasini yarating, bulut yarating va ushbu ma'lumotlar bazasini o'sha bulutda ishga tushiring, ushbu ilova yordamida ma'lumotlar bazasidan foydalanish uchun API yarating, tasvirlar yuklanmaganligiga ishonch hosil qiling. ishdan chiqishning oldini olish uchun asosiy ip",
    jobLocation: "Tashkent, Mirzo Ulug'bek",
    numberOfPeopleNeeded: 4,
    postStatus: .searching(appliedPeopleIds: [mockProfile.id], acceptedPeopleIds: nil)
)

let mockQuicHelp = QuickHelp(
    id: String(UUID().uuidString),
    creatorId: mockProfile.id,
    jobName: "To'shakni 5-qavatga olib borish kerak",
    jobDesription: "Menda 2 darajali karavot bor, uni zinapoya orqali 4-qavatga olib chiqish uchun menga 4 kishi kerak.",
    numberOfPeopleNeeded: "4",
    hourlyWage: "30000"
)

let mockReview = Review(
    id: String(UUID().uuidString),
    creatorId: mockProfile.id,
    to: mockPost.id,
    stars: 4,
    comment: "Ish yaxshi edi. Ular yaxshi to'lashdi. Davom eting va rahmat!"
)

let mockResponse = EmployeeResponse(
    id: String(UUID().uuidString),
    postId: mockPost.id,
    wage: "",
    metric: "",
    reasoning: ""
)
