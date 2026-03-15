import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    let tabs = ["Sports", "Politics", "Business", "Health", "Science"]
    let tabData: [Int: [String]] = [
        0: ["India wins Test series against Australia", "Premier League title race heats up", "NBA playoffs: Top seeds secure leads", "Global leaders meet at UN summit", "New trade agreement signed", "Parliament approves infrastructure bill",],
        1: ["Global leaders meet at UN summit", "New trade agreement signed", "Parliament approves infrastructure bill",],
        2: ["Tech stocks rally after earnings", "Startup raises $500M funding", "Oil prices drop amid demand concerns"],
        3: ["Sleep quality linked to heart health", "WHO releases updated diet guidelines", "Breakthrough in Alzheimer's treatment"],
        4: ["NASA confirms water ice on Mars", "AI model achieves human-level benchmark", "New deep-sea creature discovered"]
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Header
            HStack {
                Text("Welcome, Sovan")
                    .font(.system(size: 20).bold())
                    .foregroundColor(Color.blue)
                
                Spacer()
                
                ZStack(alignment: .topTrailing) {
                    Button(action: {}) {
                        Image(systemName: "bell")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    }
                    Text("2")
                        .font(.system(size: 12))
                        .padding(4)
                        .foregroundColor(.white)
                        .background(.red)
                        .clipShape(Circle())
                        .offset(x: 4, y: -6)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 10)
            
            // Tabs
            NewsTab(tabs: tabs, selectedTab: $selectedTab)
                .padding(.bottom, 10)
            
            // ← This is the key fix
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(tabData[selectedTab] ?? [], id: \.self) { item in
                        NewsCard(headline: item)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
}
