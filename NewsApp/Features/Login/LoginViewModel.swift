import Foundation
import Combine
@MainActor
class LoginViewModel: ObservableObject {
    
    @Published var currentUser: User?
    
    func login(user: User) {
        currentUser = user
        UserDefaultsManager.shared.setIsLoggedIn(true)
        UserDefaultsManager.shared.setUserName(currentUser?.name)
    }
    
    func logout() {
        currentUser = nil
        UserDefaultsManager.shared.clearUserData()
    }
}
