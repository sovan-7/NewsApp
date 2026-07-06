import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedTab = 0
    @State private var selectedArticle: Article? = nil  // ✅ track selected article
    let tabs = ["Sports", "Politics", "Business", "Health", "Science"]

    var body: some View {
        NavigationStack{
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
                    .onChange(of: selectedTab) {
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
                            ForEach(viewModel.articles, id: \.url) { article in
                                NewsCard(article: article)
                                    .onTapGesture {
                                        selectedArticle = article  // ✅ set on tap
                                    }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                    }
                }
            }
            
            .task {
                if viewModel.articles.isEmpty {
                    await viewModel.fetchNews(for: selectedTab)
                }
            }
            .background(Color.white).navigationDestination(item: $selectedArticle) { article in  // ✅ triggers navigation
                NewsDetails(article: article)
            }
        }
    }
}
