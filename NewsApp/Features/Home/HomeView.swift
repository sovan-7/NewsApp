import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedTab = 0
    let tabs = ["Sports", "Politics", "Business", "Health", "Science"]
   
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
                .padding(.bottom, 10).onChange(of: selectedTab) {   // ← fetch on tab change
                    Task {
                        await viewModel.fetchNews(for: selectedTab)
                    }
                }
            if viewModel.isLoading {
                            Spacer()
                            ProgressView("Loading...")
                            Spacer()

                        } else if let error = viewModel.errorMessage {
                            Spacer()
                            Text(error)
                                .foregroundColor(.red)
                            Spacer()

                        } else {
                            ScrollView {
                                LazyVStack(spacing: 12) {
                                    ForEach(viewModel.articles , id: \.url) { article in
                                        ZStack {
                                                                            NavigationLink(destination: NewsDetails(article: article)) {
                                                                                EmptyView()
                                                                            }
                                                                            .opacity(0)

                                                                            NewsCard(article: article)
                                                                        }
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.bottom, 16)
                                
                            }
            }
        }.task {
            await viewModel.fetchNews(for: selectedTab)  // ← called when screen first appears
        }.background(Color.white)
           
    }
}
