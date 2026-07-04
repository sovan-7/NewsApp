//
//  CoreExtensions.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 19/03/26.
//

import Foundation
extension Date {
    var readableString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: self)
    }
}
