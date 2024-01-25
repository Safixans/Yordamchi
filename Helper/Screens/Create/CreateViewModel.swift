//
//  CreateViewModel.swift
//  Helper
//
//  Created by Asror Aliqulov on 25/01/24.
//

import SwiftUI
import PhotosUI

@Observable
class CreateViewModel {
    var isQuickHelp = true
    var jobName = ""
    var jobDescription = ""
    var relevantPhotos = [PhotosPickerItem]()
    var selectedImages = [Image]()
    var necessaryPeople = ""
}
