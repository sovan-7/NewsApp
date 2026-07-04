//
//  LoginView.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 10/03/26.
//

import SwiftUI

struct LoginFormError{
    let emailErrorMsg:String=""
    let passwordErrorMsg:String=""
}

struct LoginView: View {
    @State private var email=""
    @State private var password=""
    @State private var loginFormError=LoginFormError()
    var body: some View {
        Form{
            Section(header: Text("Login")){
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
            }
            Button("Login"){
                
            }
        }
    }
}

#Preview {
    LoginView()
}
