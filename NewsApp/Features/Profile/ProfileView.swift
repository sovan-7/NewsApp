import SwiftUI

struct ProfileView: View {
    
    let menuItems: [(icon: String, title: String)] = [
        ("doc.text", "Terms & Condition"),
        ("lock.shield", "Privacy Policy"),
        ("calendar.badge.checkmark", "About Us"),
        ("square.and.arrow.up", "Share"),
        ("rectangle.portrait.and.arrow.right", "Logout")
    ]
    @State private var path = NavigationPath()
    @State private var showShareSheet = false
    private let appStoreLink = "https://apps.apple.com/app/id123456789"
    @State private var showLogoutAlert = false
    @State private var appState=AppState()
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        NavigationStack(path: $path){
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    // MARK: - Profile Header
                    HStack(alignment: .center, spacing: 16) {
                        
                        // Avatar
                        Image( "ProfileImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                            .foregroundColor(themeManager.colors.textMuted)
                        
                        // Info
                        VStack(alignment: .leading, spacing: 8) {
                            
                            // Name + Edit
                            HStack {
                                Text("Sovanlal Maity")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(themeManager.colors.textColor)
                                Spacer()
                                Button(action: {}) {
                                    Image(systemName: "pencil")
                                        .font(.system(size: 18))
                                        .foregroundColor(themeManager.colors.textColor)
                                }
                            }
                            
                            // Phone
                            HStack(spacing: 8) {
                                Image(systemName: "iphone.and.arrow.forward")
                                    .font(.system(size: 16))
                                    .foregroundColor(themeManager.colors.textColor)
                                Text("+91 7602214180")
                                    .font(.system(size: 15))
                                    .foregroundColor(themeManager.colors.textColor)
                            }
                            
                            // Email
                            HStack(spacing: 8) {
                                Image(systemName: "envelope")
                                    .font(.system(size: 16))
                                    .foregroundColor(themeManager.colors.textColor)
                                Text(verbatim:"sovan@nexanews.com")
                                    .font(.system(size: 15))
                                    .foregroundColor(themeManager.colors.textColor)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 24)
                    .padding(.bottom, 24)
                    
                    // MARK: - Profile Complete
                    VStack(alignment: .leading, spacing: 8) {
                        Text("10% Profile Complete")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(themeManager.colors.textColor)
                        
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color(themeManager.colors.textMuted))
                                    .frame(height: 8)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(themeManager.colors.secondary)
                                    .frame(width: geo.size.width * 0.10, height: 8)
                            }
                        }
                        .frame(height: 8)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 24)
                    
                    Divider()
                    
                    // MARK: - Menu Items
                    ForEach(menuItems, id: \.title) { item in
                        Button(action: {
                            handleMenuTap(item.title)
                        }) {
                            HStack(spacing: 16) {
                                Image(systemName: item.icon)
                                    .font(.system(size: 20))
                                    .foregroundColor(themeManager.colors.textColor)
                                    .frame(width: 28)
                                
                                Text(item.title)
                                    .font(.system(size: 16))
                                    .foregroundColor(themeManager.colors.textColor)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 28))
                                    .foregroundColor(themeManager.colors.textColor)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 18)
                        }
                        
                        Divider()
                    }
                    
                    // MARK: - Version
                    Text("Version:1.0.0")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(themeManager.colors.textColor)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 20)
                }
            }
            .navigationBarHidden(true)
            .background(Color.white).navigationDestination(for: String.self) { value in
                if value == "privacyPolicy" {
                    AppContentView( contentType: LegalContentType.privacyPolicy)
                }else if value == "termsAndConditions" {
                    AppContentView( contentType: LegalContentType.termsAndConditions)
                }else if value == "aboutUs" {
                    AppContentView( contentType: LegalContentType.aboutUs)
                }
            }.sheet(isPresented: $showShareSheet) {
                ShareSheet(items: [
                    "Check out Nexa News — your go-to app for real-time news updates! Download it here: \(appStoreLink)"
                ])
            }.overlay {
                if showLogoutAlert {
                    LogoutAlert(
                        onCancel: { showLogoutAlert = false },
                        onConfirm: {
                            showLogoutAlert = false
                            performLogout()
                        }
                    )
                    .transition(.opacity.combined(with: .scale(scale: 0.9)))
                    .animation(.easeInOut(duration: 0.2), value: showLogoutAlert)
                }
            }
        }
    }





private func handleMenuTap(_ title: String) {
        switch title {
        case "Privacy Policy":
            path.append("privacyPolicy")
        case "Terms & Condition":
             path.append("termsAndConditions")
            break
        case "About Us":
             path.append("aboutUs")
            break
        case "Share":
            showShareSheet = true
            break
        case "Logout":
            showLogoutAlert = true
            break
        default:
            break
        }
    }
    
    private func performLogout() {
        appState.logout()
        }
}

struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        controller.excludedActivityTypes = [
            .assignToContact,
            .saveToCameraRoll,
            .print
        ]
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#Preview {
    ProfileView()
}
