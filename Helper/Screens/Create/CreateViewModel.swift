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
