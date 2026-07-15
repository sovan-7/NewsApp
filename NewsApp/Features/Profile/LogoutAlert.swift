import SwiftUI
struct LogoutAlert: View {
    var onCancel: () -> Void
    var onConfirm: () -> Void
@EnvironmentObject var themeManager: ThemeManager
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture { onCancel() }

            VStack(spacing: 16) {
                Text("LOGOUT!")
                    .font(.system(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(themeManager.colors.textColor)

                Text("Are you sure, want to logout?")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(themeManager.colors.textMuted)
                    .padding(.horizontal, 8)

                Spacer(minLength: 8)

                HStack(spacing: 12) {
                    Button(action: onCancel) {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color(themeManager.colors.textMuted))
                            .cornerRadius(12)
                    }

                    Button(action: onConfirm) {
                        Text("Yes")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(themeManager.colors.primary)
                            .cornerRadius(12)
                    }
                }
            }
            .padding(24)
            .frame(width: 300, height: 180)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
        }
    }
}
