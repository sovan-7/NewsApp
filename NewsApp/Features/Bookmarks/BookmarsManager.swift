import Foundation
import Combine
class BookmarkManager: ObservableObject {
    static let shared = BookmarkManager()
    
    @Published var bookmarkedArticles: [Article] = []
    
    private let key = "bookmarked_articles"
    
    init() {
        load()  // load saved articles on app start
    }
    
    // MARK: - Add or Remove
    func toggleBookmark(article: Article) {
        if isBookmarked(article: article) {
            remove(article: article)
        } else {
            add(article: article)
        }
    }
    
    // MARK: - Check if bookmarked
    func isBookmarked(article: Article) -> Bool {
        return bookmarkedArticles.contains(where: { $0.url == article.url })
    }
    
    // MARK: - Private helpers
    private func add(article: Article) {
        bookmarkedArticles.append(article)
        save()
    }
    
    private func remove(article: Article) {
        bookmarkedArticles.removeAll(where: { $0.url == article.url })
        save()
    }
    
    // MARK: - Save & Load from UserDefaults
    private func save() {
        if let encoded = try? JSONEncoder().encode(bookmarkedArticles) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Article].self, from: data) {
            bookmarkedArticles = decoded
        }
    }
}
