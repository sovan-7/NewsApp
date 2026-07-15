import Foundation

struct APIEndpoints {
    
    static let baseURL = "https://newsapi.org/v2"
    
    static func topHeadlines(category: String) -> String {
        return "\(baseURL)/top-headlines?country=us&category=\(category)&apiKey=\(Constants.apiKey)"
    }
}
