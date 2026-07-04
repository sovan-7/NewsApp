import Combine
import Foundation

///AppState is holding global state
class AppState: ObservableObject {
    ///when value will change Published will notify global state
    @Published var isLoggedIn: Bool = false
    @Published var currentUser: User?
    
    func login(user: User) {
        currentUser = user
        isLoggedIn = true
    }
    
    func logout() {
        currentUser = nil
        isLoggedIn = false
    }
}
