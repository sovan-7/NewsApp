//
//  AppContentView.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 05/07/26.
//

import SwiftUI

struct AppContentView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack{
            Image("PrivacyPolicy").resizable().frame(height: 150).frame(width: 150)
            WebView(htmlContentString: PrivacyPolicyConst.privacyPolicy)

        } .navigationTitle("Privacy Policy")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
    
}

#Preview {
    AppContentView()
}
