import SwiftUI

struct BookmarksView: View {
    @Binding var selectedArticle: Article?  
    @ObservedObject var bookmarkManager = BookmarkManager.shared
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
       
            ZStack{
                themeManager.colors.background
                                    .ignoresSafeArea()
                VStack(alignment: .leading,spacing: 0) {
                           Text("Bookmarks")
                        .font(.largeTitle).foregroundColor(themeManager.colors.textColor).bold()
                               .padding(.horizontal)
                if bookmarkManager.bookmarkedArticles.isEmpty {
                    Spacer()
                    VStack {
                        Image(systemName: "bookmark.slash")
                            .font(.system(size: 50))
                            .foregroundColor(themeManager.colors.primary)
                        Text("No bookmarks yet").font(.title2)
                            .foregroundColor(themeManager.colors.textColor)
                        Text("Save articles as you read to find them here later.")
                            .foregroundColor(themeManager.colors.textMuted)
                    }.frame(maxWidth: .infinity)
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(bookmarkManager.bookmarkedArticles, id: \.url) { article in
                                NewsCard(article: article).onTapGesture {
                                    selectedArticle = article
                                    
                                }
                            }
                        }
                        .padding()
                    }
                }
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

                
            
        }.navigationDestination(item: $selectedArticle) { article in
            NewsDetails(article: article)
        }
            
    }
}
