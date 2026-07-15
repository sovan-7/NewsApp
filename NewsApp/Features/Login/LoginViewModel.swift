import Foundation
import Combine
@MainActor
class LoginViewModel: ObservableObject {
    
    @Published var currentUser: User?
    
    func login(user: User) {
        currentUser = user
        UserDefaultsManager.shared.setIsLoggedIn(true)
        if let name = currentUser?.name {
            UserDefaultsManager.shared.setUserName(name)
        }
        if let email = currentUser?.email {
            UserDefaultsManager.shared.setUserEmail(email)
        }
    }
    
    func logout() {
        currentUser = nil
        UserDefaultsManager.shared.clearUserData()
    }
}
