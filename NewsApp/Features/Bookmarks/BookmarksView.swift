import SwiftUI

struct BookmarksView: View {
    @ObservedObject var bookmarkManager = BookmarkManager.shared

    var body: some View {
        NavigationView {
            ZStack{
                Color.white
                                    .ignoresSafeArea()
                if bookmarkManager.bookmarkedArticles.isEmpty {
                    VStack {
                        Image(systemName: "bookmark.slash")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("No bookmarks yet")
                            .foregroundColor(.gray)
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(bookmarkManager.bookmarkedArticles, id: \.url) { article in
                                NewsCard(article: article)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationTitle("Bookmarks")
    }
}
