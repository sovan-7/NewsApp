import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            HomeView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            
            HomeView()
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark")
                }
            
            HomeView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}
#Preview{
    DashboardView()
}
