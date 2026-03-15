//import Foundation
//
//@MainActor
//class LoginViewModel: ObservableObject {
//    
//    @Published var email = ""
//    @Published var password = ""
//    
//    func login(appState: AppState) async {
//        
//        do {
//            let user = try await AuthService.shared.login(
//                email: email,
//                password: password
//            )
//            
//            appState.login(user: user)
//            
//        } catch {
//            print(error)
//        }
//    }
//}
