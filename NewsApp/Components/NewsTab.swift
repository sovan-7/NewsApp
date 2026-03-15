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

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Button(action: {
                        selectedTab = index
                    }) {
                        VStack(spacing: 4) {
                            Text(tabs[index])
                                .font(.system(size: 14, weight: selectedTab == index ? .semibold : .regular))
                                .foregroundColor(selectedTab == index ? .blue : .gray)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                            
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(selectedTab == index ? .blue : .clear)
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    NewsTab()
//}
