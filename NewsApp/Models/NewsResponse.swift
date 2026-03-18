import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Hashable, Equatable, Codable {
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title, url, urlToImage, publishedAt, content
        case articleDescription = "description"
    }
}

// MARK: - Source
struct Source: Hashable, Equatable, Codable {  // ✅ added Hashable & Equatable
    let id: String?
    let name: String
}
