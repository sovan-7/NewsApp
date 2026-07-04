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
    private let accentColor = Color(red: 0x37 / 255, green: 0x8A / 255, blue: 0xDD / 255)
        private let accentLight = Color(red: 0xE6 / 255, green: 0xF1 / 255, blue: 0xFB / 255)
        private let borderColor = Color(red: 0xD8 / 255, green: 0xD8 / 255, blue: 0xD8 / 255)
        private let secondaryText = Color(red: 0x6B / 255, green: 0x6B / 255, blue: 0x6B / 255)
        private let mutedIcon = Color(red: 0x9A / 255, green: 0x9A / 255, blue: 0x9A / 255)
    var body: some View {
        
        ScrollView{
            VStack{
                logoBadge.padding(.top,40)
                VStack{
                    Text("Welcome Back").font(.system(size: 22,weight: .medium)).foregroundColor(.black)
                    Text("Sign in to pick up where you left off.").font(.system(size: 14)).foregroundColor(secondaryText).multilineTextAlignment(.center)
                }.padding(.bottom,8)
                VStack( spacing:16){
                    labelField(label: "Email", icon: "envelope", placeHolder: "name@company.com", ){
                        TextField("name@company.com", text: $email).keyboardType(.emailAddress).textInputAutocapitalization(.never).autocorrectionDisabled(true)
                    }
                        
                    labelPasswordField
                    Button( action: {}){
                        Text("Sign in").font(.system(size: 16,weight:    .medium)).foregroundColor(.white).frame(maxWidth: .infinity).frame(height: 46).background(accentColor).cornerRadius(10)
                    }.padding(.top,4)
                    HStack(spacing: 4) {
                                       Text("New here?")
                                           .font(.system(size: 13))
                                           .foregroundColor(secondaryText)
                                       Button(action: {}) {
                                           Text("Create an account")
                                               .font(.system(size: 13, weight: .medium))
                                               .foregroundColor(accentColor)
                                       }
                                   }
                                   .padding(.top, 12)
                                   .padding(.bottom, 32)
                               }.padding(.top, 12)
                    .padding(.bottom, 32)
                               
                
                
            }.padding(.horizontal, 24)
                
        }.background(Color.white)        .scrollBounceBehavior(.basedOnSize)

    }
    
    private var logoBadge:some View{
        RoundedRectangle(cornerRadius: 14).fill(accentLight).frame(width: 56, height: 56).overlay(){
            Image("bolt.fill").font(.system(size: 24)).foregroundColor(accentColor)
        }
    }
    
    @ViewBuilder
    private func labelField<Content:View>(label:String,icon:String,placeHolder:String,@ViewBuilder content:()    -> Content) -> some View {
        VStack(alignment: .leading,spacing: 6){
            Text(label).font(.system(size: 13)).foregroundColor(secondaryText)
            HStack{
                HStack(spacing: 8,){
                    Image(systemName: icon).font(.system(size: 16)).foregroundColor(mutedIcon).frame(width: 18)
                    content().font(.system(size: 15)).foregroundColor(.black)
                }.padding(.horizontal,12).frame(height: 44).overlay(RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 1))
            }
        }
    }
    
    private var labelPasswordField: some View {
        VStack(alignment: .leading,spacing: 6){
            Text("Password").font(.system(size: 13)).foregroundColor(secondaryText)
            HStack(spacing: 8,){
                Image(systemName: "lock").font(.system(size: 16)).foregroundColor(mutedIcon).frame(width: 18)
                Group{
                    if isPasswordVisible{
                        TextField("Enter your password", text: $password)
                    }else{
                        SecureField("Enter your password", text: $password)
                    }
                }.font(.system(size: 15)).foregroundColor(.black)
                Button( action: {
                    isPasswordVisible.toggle()
                }){
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .font(.system(size: 16))
                        .foregroundColor(mutedIcon)
                }
            }.padding(.horizontal,12).frame(height: 44).overlay(RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 1))
            
        }
    }
}
#Preview {
    LoginView()
}
