//
//  TrendingNews.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 16/07/26.
//

import SwiftUI

struct TrendingNews: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var themeManager: ThemeManager
    @State private var selectedID: Article.ID?

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 0) {
               
                   
                    Text("Trending News")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(themeManager.colors.textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(themeManager.colors.background)

                ScrollView(.vertical) {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.articles, id: \.url) { article in
                            NewsDetails(article: article,shouldHeaderShow:false)
                                .containerRelativeFrame(.vertical)
                                .id(article.id)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .scrollPosition(id: $selectedID)
            }
        }
        .onAppear {
            
                    selectedID = viewModel.articles.first?.id
                
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
//#Preview {
//    TrendingNews()
//}
