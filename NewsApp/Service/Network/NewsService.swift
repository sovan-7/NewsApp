import Foundation

protocol NewsServiceProtocol {
    func fetchTopHeadlines(category: String) async throws -> [Article]
}

class NewsService:NewsServiceProtocol {
    
    static let shared = NewsService()
    
    func fetchTopHeadlines(category: String) async throws -> [Article] {
        
        struct Response: Codable {
            let articles: [Article]
        }
        
        let response: Response = try await APIClient.shared.request(
            urlString: APIEndpoints.topHeadlines(category: category)
        )
        
        return response.articles
    }
}
