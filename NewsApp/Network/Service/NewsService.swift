import Foundation

class NewsService {
    
    static let shared = NewsService()
    
    func fetchTopHeadlines() async throws -> [Article] {
        
        struct Response: Codable {
            let articles: [Article]
        }
        
        let response: Response = try await APIClient.shared.request(
            urlString: APIEndpoints.topHeadlines()
        )
        
        return response.articles
    }
}
