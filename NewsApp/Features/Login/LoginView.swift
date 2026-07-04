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
    @State private var isPasswordVisible: Bool = false
    @State private var rememberMe: Bool = false
    @State private var loginFormError=LoginFormError()
    var body: some View {
        
        ScrollView{
            VStack{
                VStack{
                    Text("Welcome Back").font(.system(size: 22,weight: .medium)).foregroundColor(.black)
                    Text("Sign in to pick up where you left off.").font(.system(size: 14)).foregroundColor(.black).multilineTextAlignment(.center)
                }.padding(.bottom,8)
                VStack( spacing:16){
                    labelField(label: "Email", icon: "envelope", placeHolder: "name@company.com", ){
                        TextField("name@company.com", text: $email).keyboardType(.emailAddress).textInputAutocapitalization(.never).autocorrectionDisabled(true)
                    }
                        
                    labelPasswordField
                    Button( action: {}){
                        Text("Sign in").font(.system(size: 16,weight: .medium)).foregroundColor(Color.white).frame(minWidth: .infinity).frame(height: 46).background(Color.blue).cornerRadius(10)
                    }
                   
                }
            }
        }
    }
    
    
    @ViewBuilder
    private func labelField<Content:View>(label:String,icon:String,placeHolder:String,@ViewBuilder content:()    -> Content) -> some View {
        VStack(alignment: .leading,spacing: 6){
            Text(label).font(.system(size: 13)).foregroundColor(.secondary)
            HStack{
                HStack(spacing: 8,){
                    Image(systemName: icon).font(.system(size: 16)).foregroundColor(.blue).frame(width: 18)
                    content().font(.system(size: 15)).foregroundColor(.black)
                }.padding(.horizontal,12).frame(height: 44).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }
        }
    }
    
    private var labelPasswordField: some View {
        VStack(alignment: .leading,spacing: 6){
            Text("Password").font(.system(size: 13)).foregroundColor(.secondary)
            HStack(spacing: 8,){
                Image(systemName: "lock").font(.system(size: 16)).foregroundColor(.blue).frame(width: 18)
                if 0==0{
                    TextField("Enter your password", text: $password)
                }else{
                    SecureField("Enter your password", text: $password)
                }
            }.padding(.horizontal,12).frame(height: 44).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            
        }
    }
}
#Preview {
    LoginView()
}
