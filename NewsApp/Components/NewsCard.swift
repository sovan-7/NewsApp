import SwiftUI

struct NewsCard: View {
    let article: Article
    @ObservedObject var bookmarkManager = BookmarkManager.shared
    @EnvironmentObject var themeManager: ThemeManager
    var body: some View {
        HStack(alignment: .center, spacing: 12) {

            AsyncImage(url: URL(string: article.urlToImage ?? "")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                case .failure:
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray5))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "newspaper")
                                .font(.system(size: 30))
                                .foregroundColor(themeManager.colors.border)
                        )
                case .empty:
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.lightGray).opacity(0.5))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "newspaper")
                                .font(.system(size: 30))
                                .foregroundColor(themeManager.colors.border)
                        )
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 100, height: 100)

            // Right VStack
            VStack(alignment: .leading, spacing: 6) {

                Text(article.author  ?? "No Data")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(themeManager.colors.textColor)
                    .textCase(.uppercase)

                Text(article.articleDescription ?? "No description available")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(themeManager.colors.textColor)
                    .lineLimit(2)

                HStack(spacing: 4) {
                    AsyncImage(url: URL(string: "https://w-hotels.marriott.com/wp-content/uploads/2025/08/Punta-Cana-hero-m.jpg")) {
                        image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15, height: 15)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .fill(Color(.systemGray5))
                            .frame(width: 15, height: 15)
                    }
                    .frame(width: 15, height: 15) // ← fixes small AsyncImage sizing

                    Text( "BBC News")
                        .font(.caption)
                        .foregroundColor(themeManager.colors.textMuted)

                    Image(systemName: "clock")
                        .font(.system(size: 12))
                        .foregroundColor(themeManager.colors.textColor)

                    Text(article.publishedAt.readableString  )
                        .font(.caption)
                        .foregroundColor(themeManager.colors.textMuted)
                    Spacer()

                                        // ← Bookmark Button
                                        Button {
                                            bookmarkManager.toggleBookmark(article: article)
                                        } label: {
                                            Image(systemName: bookmarkManager.isBookmarked(article: article)
                                                  ? "bookmark.fill"  // ← saved
                                                  : "bookmark")      // ← not saved
                                            .foregroundColor(themeManager.colors.primary)
                                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(.clear)
        .cornerRadius(14).overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(themeManager.colors.border, lineWidth: 0.5))
    }
    

}
