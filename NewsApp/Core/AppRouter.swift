import SwiftUI



struct AppRouter: View {
    ///EnvironmentObject is like global storage for view
    @EnvironmentObject var appState: AppState
    
    
    var body: some View {
        Group {
        if appState.isLoggedIn {
            DashboardView()
        } else {
            LoginView()
        }
        }
                .environmentObject(appState)
    }
}
