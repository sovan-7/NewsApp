//import Foundation
//
//@MainActor
//class HomeViewModel: ObservableObject {
//    
//    @Published var articles: [Article] = []
//    
//    func loadNews() async {
//        
//        do {
//            articles = try await NewsService.shared.fetchTopHeadlines()
//        } catch {
//            print(error)
//        }
//    }
//}
