//
//  ThemeManager.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 09/07/26.
//

import Foundation
import SwiftUI
import Combine


 class ThemeManager :ObservableObject{
     @AppStorage("theme") var theme:AppTheme = .system {
             didSet { updateColors() }
         }
      
         @Published var colors: ThemeColors = .light
      
         var colorScheme:ColorScheme?{
             switch theme {
             case .light:
                 return .light
             case .dark:
                 return .dark
             case .system:
                 return nil
             }
         }
      
         func updateColors(system: ColorScheme = .light) {
             let isDark = theme == .dark || (theme == .system && system == .dark)
             colors = isDark ? .dark : .light
         }
}
