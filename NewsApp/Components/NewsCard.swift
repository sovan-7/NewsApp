import SwiftUI

struct NewsCard: View {
    let article: Article
    @ObservedObject var bookmarkManager = BookmarkManager.shared  // ← add this
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
                                .foregroundColor(.gray)
                        )
                case .empty:
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.lightGray).opacity(0.5))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "newspaper")
                                .font(.system(size: 30))
                                .foregroundColor(.gray)
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
                    .foregroundColor(.black)
                    .textCase(.uppercase)

                Text(article.articleDescription ?? "No description available")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
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
                        .foregroundColor(.gray)

                    Image(systemName: "clock")
                        .font(.system(size: 12))
                        .foregroundColor(.black)

                    Text(article.publishedAt.readableString  )
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()

                                        // ← Bookmark Button
                                        Button {
                                            bookmarkManager.toggleBookmark(article: article)
                                        } label: {
                                            Image(systemName: bookmarkManager.isBookmarked(article: article)
                                                  ? "bookmark.fill"  // ← saved
                                                  : "bookmark")      // ← not saved
                                                .foregroundColor(.blue)
                                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12) // ← this was missing, causes card to show content
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.01))
        .cornerRadius(14).overlay( // ← add this
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.gray.opacity(0.3), lineWidth: 0.5))
    }
    
}
extension Date {
    var readableString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: self)
    }
}

//#Preview {
//    NewsCard(headline: "India wins Test series against Australia in dramatic fashion")
//        .padding()
//}
