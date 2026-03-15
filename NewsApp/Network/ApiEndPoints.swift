import Foundation

struct APIEndpoints {
    
    static let baseURL = "https://newsapi.org/v2"
    
    static func topHeadlines() -> String {
        return "\(baseURL)/top-headlines?country=us&apiKey=\(Constants.apiKey)"
    }
}
