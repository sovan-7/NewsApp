//
//  CoreExtensions.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 19/03/26.
//
import SwiftUI
import Foundation
extension Date {
    var readableString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: self)
    }
}
extension Color {
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: 1
        )
    }
}
extension String{
    var isValidEmail:Bool{
        let emailRegx="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate=NSPredicate(format:"SELF MATCHES %@", emailRegx)
        return emailPredicate.evaluate(with: self)
    }
     
}
enum LegalContentType {
    case privacyPolicy
    case termsAndConditions
    case aboutUs

    var title: String {
        switch self {
        case .privacyPolicy:
            return "Privacy Policy"
        case .termsAndConditions:
            return "Terms & Conditions"
        case .aboutUs:
            return "About Us"
        }
    }

    var imageName: String {
        switch self {
        case .privacyPolicy:
            return "PrivacyPolicy"
        case .termsAndConditions:
            return "TermsAndConditions"
        case .aboutUs:
            return "AboutUs"
        }
    }

    var htmlContent: String {
        switch self {
        case .privacyPolicy:
            return PrivacyPolicyConst.privacyPolicy
        case .termsAndConditions:
            return TermsAndConditionsConst.termsAndConditions
        case .aboutUs:
            return AboutUsConst.aboutUs
        }
    }
}


