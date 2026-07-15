import SwiftUI



struct AppRouter: View {
    ///EnvironmentObject is like global storage for view
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @StateObject private var themeManager = ThemeManager()
    @Environment(\.colorScheme) private var systemColorScheme 

    var body: some View {
        Group {
            if (UserDefaultsManager.shared.getIsLoggedIn()) {
            DashboardView()
        } else {
            LoginView()
        }
        }.environmentObject(themeManager)
            .preferredColorScheme(themeManager.colorScheme)
                .environmentObject(loginViewModel)
                .onAppear {
                    themeManager.updateColors(system: systemColorScheme)
                }
                .onChange(of: systemColorScheme) { _, newValue in
                    themeManager.updateColors(system: newValue)
                }
    }
}
