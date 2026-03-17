import Foundation
import Combine  // ← THIS was missing

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    let tabCategories = ["sports", "politics", "business", "health", "science"]
    
    func fetchNews(for tabIndex: Int) async {
        isLoading = true
        errorMessage = nil
        articles = []
        let category = tabCategories[tabIndex]  // e.g. 0 → "sports"

        do {
            articles = try await NewsService.shared.fetchTopHeadlines(category: category)
        } catch {
            print("❌ FETCH ERROR: \(error)")          // ← exact error
            print("❌ ERROR DESCRIPTION: \(error.localizedDescription)")
            errorMessage = "Failed to load news. Please try again."
        }
        
        isLoading = false
    }
}
