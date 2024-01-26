//
//  CreateViewModel.swift
//  Helper
//
//  Created by Asror Aliqulov on 25/01/24.
//

import SwiftUI
import PhotosUI
import Observation

@Observable
class CreateViewModel {
    
    enum Field {
       case jobName, jobDescription, relevantPhotos, necessaryPeople, duration, tags, startingDate
    }
    
    var canSubmit: Bool {
        if isQuickHelp {
            return jobName.isEmpty || jobDescription.isEmpty
        } else {
            if hasDuration {
                return jobName.isEmpty || jobDescription.isEmpty || duration.isEmpty
            }
            if hasTags {
                return jobName.isEmpty || jobDescription.isEmpty || tags.isEmpty
            }
            return false
        }
    }
    
    var isQuickHelp = true
    var jobName = ""
    var jobDescription = ""
    var relevantPhotos: [PhotosPickerItem] = [] {
        didSet {
            Task {
                await updateSelectedImages()
            }
        }
    }
    var selectedImages: [Image] = []
    var necessaryPeople = ""
    
    private func updateSelectedImages() async {
        var newImages: [Image] = []
        for photoItem in relevantPhotos {
            if let image = try? await photoItem.loadTransferable(type: Image.self) {
                newImages.append(image)
            }
        }
        self.selectedImages = newImages
        
    }
    
    // following are specific to posts only
    
    var hasStartingDate = false
    var startingDate = Date()
    var hasDuration = false
    var duration = ""
    var hasTags = false
    var tags = ""
}
