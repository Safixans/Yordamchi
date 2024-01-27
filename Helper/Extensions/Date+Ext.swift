//
//  Date+Ext.swift
//  Helper
//
//  Created by Davron Abdukhakimov on 28/01/24.
//

import Foundation
func getTime(date:Date)->String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: Date())
}
