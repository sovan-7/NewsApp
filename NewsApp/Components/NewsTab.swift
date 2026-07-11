//
//  NewsTab.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 13/03/26.
//

import SwiftUI

struct NewsTab: View {
    let tabs: [String]
        @Binding var selectedTab: Int
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Button(action: {
                        selectedTab = index
                    }) {
                        VStack(spacing: 4) {
                            Text(tabs[index])
                                .font(.system(size: 14, weight: selectedTab == index ? .semibold : .semibold))
                                .foregroundColor(selectedTab == index ? themeManager.colors.primary : themeManager.colors.border.opacity(0.7))
                                .padding(.horizontal, selectedTab == index ? 14 : 10)
                                .padding(.vertical, 6).background(Capsule().fill(selectedTab == index ? themeManager.colors.textWhite : .clear))
                            
                            
                        } .padding(.leading, index == 0 ? 16 : 0)
                    }
                }
            }
        }
    }
}

//#Preview {
//    NewsTab()
//}
