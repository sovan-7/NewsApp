//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 10/03/26.
//

import SwiftUI

@main
struct NewsAppApp: App {
    @StateObject  private var appState = AppState()
    let persistence = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            AppRouter()
                            .environmentObject(appState)
        }
    }
}
