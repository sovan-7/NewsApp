//
//  WebView.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 05/07/26.
//

import SwiftUI
import WebKit
struct WebView: UIViewRepresentable {
    let htmlContentString: String
    func makeUIView(context:Context)-> WKWebView{
        let wkWebView=WKWebView()
        return wkWebView
    }
    func updateUIView(_ uiView:WKWebView,context: Context){
        uiView.loadHTMLString(htmlContentString, baseURL: nil)
    }
}


