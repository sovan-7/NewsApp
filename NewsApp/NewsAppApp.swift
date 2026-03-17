//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 10/03/26.
//

import SwiftUI

@main
struct NewsAppApp: App {
    init() {
           UITabBar.appearance().unselectedItemTintColor = .systemGray  // ✅ gray for unselected
           UITabBar.appearance().tintColor = .black                     // ✅ black for selected
       }
    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
    }
}
