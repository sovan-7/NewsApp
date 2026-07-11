//
//  ThemeColors.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 09/07/26.
//

import Foundation
import SwiftUI

struct ThemeColors {
    let primary: Color
    let secondary: Color
    let background: Color
    let fieldBackground: Color
    let textColor: Color
    let textSecondary: Color
    let textWhite: Color
    let textMuted: Color
    let border: Color
}

extension ThemeColors {
    static let light = ThemeColors(
        primary: Color(hex: 0x1D5D51),
        secondary: Color(hex: 0x1DD3D1D),
        background: Color(hex: 0xFFFFFF),
        fieldBackground: Color(hex: 0xF3F3F0),
        textColor: Color(hex: 0x101513),
        textSecondary: Color(hex: 0x5C6B65),
        textWhite: Color(hex: 0xFFFFFF),
        textMuted: Color(hex: 0x9AA6A0),
        border: Color(hex: 0xE4E4DF)
    )

    static let dark = ThemeColors(
        primary: Color(hex: 0x1D5D51),
        secondary: Color(hex: 0x1DD3D1D),
        background: Color(hex: 0x101513),
        fieldBackground: Color(hex: 0x1F2723),
        textColor: Color(hex: 0xF1F3F1),
        textSecondary: Color(hex: 0x9BAAA3),
        textWhite: Color(hex: 0xFFFFFF),
        textMuted: Color(hex: 0x66756F),
        border: Color(hex: 0x2B3430)
    )
}
