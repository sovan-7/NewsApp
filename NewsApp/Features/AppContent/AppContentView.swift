//
//  AppContentView.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 05/07/26.
//

import SwiftUI

struct AppContentView: View {
    @Environment(\.dismiss) private var dismiss
    let contentType: LegalContentType

    var body: some View {
        VStack{
            Image(contentType.imageName).resizable().frame(height: 200).frame(width: 250)
            WebView(htmlContentString: contentType.htmlContent)

        } .navigationTitle(contentType.title)
            .navigationBarTitleDisplayMode(.inline)

        }
    
}

//#Preview {
//    AppContentView()
//}
