//
//  ThemeColors.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 09/07/26.
//

import Foundation
import SwiftUI
struct ThemeColors{
    let primary:Color
    let secondary: Color
    let background: Color
    let textColor: Color
    let textColorGrey:Color
    let iconColor: Color
    let borderColor:Color
}

extension ThemeColors{
    static let light=ThemeColors(
        primary: Color(hex:0x1d5d51),
        secondary: Color(hex:0x1d5d51),
        background: Color(hex:0xFAFAF8),
        textColor: Color(hex:0x000000),
        textColorGrey: Color(hex: 0x6B6B6B),
        iconColor:Color(hex: 0x9A9A9A),
        borderColor:Color(hex: 0xF3F3F0)
    )
    static let dark=ThemeColors(
        primary: Color(hex:0x1d5d51),
        secondary: Color(hex:0x1d5d51),
        background: Color(hex:0x000000),
        textColor: Color(hex:0xFFFFFF),
        textColorGrey: Color(hex: 0x6B6B6B),
        iconColor: Color(hex: 0x9A9A9A),
        borderColor: Color(hex: 0xD8D8D8)
    )
}
