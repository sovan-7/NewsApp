import SwiftUI

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = 0
    @State private var selectedArticle: Article? = nil  
    let tabs: [TabItem] = [
        TabItem(icon: "house",                        label: "Home"),
        TabItem(icon: "chart.line.uptrend.xyaxis",    label: "Trending"),
        TabItem(icon: "bookmark",                     label: "Bookmarks"),
        TabItem(icon: "person",                       label: "Profile")
    ]
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        
            VStack(spacing: 0) {
                
                Group {
                    switch selectedTab {
                    case 0:
                        HomeView(selectedArticle: $selectedArticle)
                    case 1:
                        HomeView(selectedArticle: $selectedArticle)
                    case 2:
                        BookmarksView(selectedArticle:  $selectedArticle, )
                    case 3:
                        ProfileView()
                    default:
                        HomeView(selectedArticle: $selectedArticle)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Divider()
                
                HStack {
                    ForEach(tabs.indices, id: \.self) { index in
                        tabButton(icon: tabs[index].icon, label: tabs[index].label, index: index)
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 25)
                .background(themeManager.colors.background)
            }
            .ignoresSafeArea(edges: .bottom).fullScreenCover(item: $selectedArticle) { article in
                NewsDetails(article: article)
            }
        
    }
        func tabButton(icon: String, label: String, index: Int) -> some View {
            Button(action: { selectedTab = index }) {
                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .font(.system(size: 22))
                    Text(label)
                        .font(.system(size: 10))
                }
                .foregroundColor(selectedTab == index ? themeManager.colors.primary : themeManager.colors.textColor.opacity(0.5))
                .frame(maxWidth: .infinity)
            }
        
    }
}
struct TabItem {
    let icon: String
    let label: String
}
