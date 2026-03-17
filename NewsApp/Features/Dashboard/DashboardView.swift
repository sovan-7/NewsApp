import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = 0
    let tabs: [TabItem] = [
            TabItem(icon: "house",                        label: "Home"),
            TabItem(icon: "chart.line.uptrend.xyaxis",    label: "Trending"),
            TabItem(icon: "bookmark",                     label: "Bookmarks"),
            TabItem(icon: "person",                       label: "Profile")
        ]
    var body: some View {
        VStack(spacing: 0) {
            
            // ✅ Content area
            Group {
                switch selectedTab {
                case 0:
                     HomeView()
                case 1:
                     HomeView()  // Trending
                case 2:
                    BookmarksView()
                case 3:
                    ProfileView()
                default:
                    HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            Divider()
                //.background(Color.gray.opacity(0.3))

            // ✅ Custom Tab Bar
            HStack {
                ForEach(tabs.indices, id: \.self) { index in
                    tabButton(icon: tabs[index].icon, label: tabs[index].label, index: index)
                    }
            }
            .padding(.top, 10)
            .padding(.bottom, 25) // accounts for home indicator
            .background(Color.white)
        }
        .ignoresSafeArea(edges: .bottom)
    }

    // ✅ Tab button builder
    func tabButton(icon: String, label: String, index: Int) -> some View {
        Button(action: { selectedTab = index }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                Text(label)
                    .font(.system(size: 10))
            }
            .foregroundColor(selectedTab == index ? .black : .gray) // ✅ full control
            .frame(maxWidth: .infinity)
        }
    }
}
struct TabItem {
    let icon: String
    let label: String
}
