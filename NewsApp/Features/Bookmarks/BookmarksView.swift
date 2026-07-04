import SwiftUI

struct BookmarksView: View {
    @Binding var selectedArticle: Article?  // ✅ receive binding
    @ObservedObject var bookmarkManager = BookmarkManager.shared

    var body: some View {
       
            ZStack{
                Color.white
                                    .ignoresSafeArea()
                VStack(alignment: .leading,spacing: 0) {
                           Text("Bookmarks")          // ✅ manual title
                        .font(.largeTitle).foregroundColor(.black).bold()
                               .padding(.horizontal)
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
                                NewsCard(article: article).onTapGesture {
                                    selectedArticle = article  // ✅ triggers navigation
                                    
                                }
                            }
                        }
                        .padding()
                    }
                }
                } .navigationDestination(item: $selectedArticle) { article in  // ✅ triggers navigation
                    NewsDetails(article: article)
                }
            
        }
            
    }
}
