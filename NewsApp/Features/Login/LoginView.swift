import SwiftUI

struct LoginFormError {
    var emailErrorMsg: String = ""
    var passwordErrorMsg: String = ""
}

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible: Bool = false
    @State private var rememberMe: Bool = false
    @State private var loginFormError = LoginFormError()
    @State private var path = NavigationPath()

    private let accentColor   = Color(hex: 0x378ADD)
    private let accentLight   = Color(hex: 0xE6F1FB)
    private let borderColor   = Color(hex: 0xD8D8D8)
    private let secondaryText = Color(hex: 0x6B6B6B)
    private let mutedIcon     = Color(hex: 0x9A9A9A)

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    logoBadge.padding(.top, 40)

                    VStack {
                        Text("Welcome Back").font(.system(size: 25, weight: .bold)).foregroundColor(.black)
                        Text("Sign in to pick up where you left off.")
                            .font(.system(size: 16))
                            .foregroundColor(secondaryText)
                            .multilineTextAlignment(.center)
                    }.padding(.bottom, 8)

                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            labelField(label: "Email", icon: "envelope", placeHolder: "name@company.com") {
                                TextField(
                                    "",
                                    text: $email,
                                    prompt: Text("name@company.com").foregroundStyle(.gray)
                                )
                                .foregroundStyle(.black)
                                .tint(accentColor)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)
                            }
                            if !loginFormError.emailErrorMsg.isEmpty {
                                Text(loginFormError.emailErrorMsg)
                                    .font(.system(size: 13))
                                    .foregroundColor(.red)
                            }
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            labelPasswordField
                            if !loginFormError.passwordErrorMsg.isEmpty {
                                Text(loginFormError.passwordErrorMsg)
                                    .font(.system(size: 13))
                                    .foregroundColor(.red)
                            }
                        }

                        HStack {
                            Button(action: { rememberMe.toggle() }) {
                                HStack(spacing: 6) {
                                    Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                                        .foregroundColor(rememberMe ? accentColor : mutedIcon)
                                    Text("Remember me")
                                        .font(.system(size: 15))
                                        .foregroundColor(secondaryText)
                                }
                            }
                            Spacer()
                            Button(action: {}) {
                                Text("Forgot?")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(accentColor)
                            }
                        }

                        Button(action: {
                            if isFormValid {
                                path.append("dashboard")
                            }
                        }) {
                            Text("Sign in")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(accentColor)
                                .cornerRadius(10)
                        }
                        .padding(.top, 4)

                        HStack(spacing: 4) {
                            Text("New here?")
                                .font(.system(size: 15))
                                .foregroundColor(secondaryText)
                            Button(action: {}) {
                                Text("Create an account")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(accentColor)
                            }
                        }
                        .padding(.top, 12)
                        .padding(.bottom, 32)
                    }
                    .padding(.top, 12)
                    .padding(.bottom, 32)
                }
                .padding(.horizontal, 24)
            }
            .background(Color.white)
            .scrollBounceBehavior(.basedOnSize)
            .navigationDestination(for: String.self) { value in
                if value == "dashboard" {
                    DashboardView()
                }
            }
        }
    }

    private var logoBadge: some View {
        RoundedRectangle(cornerRadius: 14).fill(accentLight).frame(width: 56, height: 56).overlay {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .font(.system(size: 24))
                .foregroundColor(accentColor)
        }
    }

    @ViewBuilder
    private func labelField<Content: View>(label: String, icon: String, placeHolder: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label).font(.system(size: 15, weight: .medium)).foregroundColor(secondaryText)
            HStack {
                HStack(spacing: 8) {
                    Image(systemName: icon).font(.system(size: 16)).foregroundColor(mutedIcon).frame(width: 18)
                    content().font(.system(size: 15))
                }
                .padding(.horizontal, 12)
                .frame(height: 46)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 1))
            }
        }
    }

    private var labelPasswordField: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Password").font(.system(size: 15, weight: .medium)).foregroundColor(secondaryText)
            HStack(spacing: 8) {
                Image(systemName: "lock").font(.system(size: 16)).foregroundColor(mutedIcon).frame(width: 18)
                Group {
                    if isPasswordVisible {
                        TextField("Enter your password", text: $password)
                    } else {
                        SecureField("Enter your password", text: $password)
                    }
                }
                .font(.system(size: 17))
                .foregroundColor(.black)
                Button(action: { isPasswordVisible.toggle() }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .font(.system(size: 16))
                        .foregroundColor(mutedIcon)
                }
            }
            .padding(.horizontal, 12)
            .frame(height: 46)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 1))
        }
    }

    // Fixed: resets errors each time, and fixes the password bug
    var isFormValid: Bool {
        loginFormError = LoginFormError() // reset before revalidating

        if email.isEmpty {
            loginFormError.emailErrorMsg = "Email is required!"
        } else if !email.isValidEmail {
            loginFormError.emailErrorMsg = "Please enter a valid email"
        }

        if password.isEmpty {
            loginFormError.passwordErrorMsg = "Password is required!"
        }

        return loginFormError.emailErrorMsg.isEmpty && loginFormError.passwordErrorMsg.isEmpty
    }
}

#Preview {
    LoginView()
}
