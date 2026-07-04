//
//  NewsCardDetails.swift
//  NewsApp
//
//  Created by Sovanlal Maity on 15/03/26.
//

import SwiftUI

struct NewsDetails: View {
    @Environment(\.presentationMode) var presentationMode
    let article: Article

    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 15) {
                // MARK: - Custom Header
                HStack() {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                            .padding(10).background(Color(.white))
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Text("News Details")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 38, height: 38)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.white)
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        // MARK: - Hero Image
                        GeometryReader { geometry in
                            AsyncImage(url: URL(string: article.urlToImage ?? "")) { phase in
                                switch phase {
                                case .success(let image):
                                    image.resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width)  // ✅ explicit screen width
                                        .frame(height: 250)
                                        .clipped()
                                        .contentShape(Rectangle())                 // ✅ prevent overflow taps
                                case .failure(_):
                                    RoundedRectangle(cornerRadius: 0)
                                        .fill(Color(.systemGray5))
                                        .frame(width: geometry.size.width)  // ✅ match same width
                                        .frame(height: 250)
                                        .overlay(
                                            Image(systemName: "photo")
                                                .foregroundColor(.gray)
                                        )
                                case .empty:
                                    RoundedRectangle(cornerRadius: 0)
                                        .fill(Color(.systemGray5))
                                        .frame(width: geometry.size.width)  // ✅ match same width
                                        .frame(height: 250)
                                        .overlay(ProgressView())
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                        .frame(height: 250)    // ✅ lock outer frame too
                        .clipped()
                        
                        // MARK: - Text Content
                        
                        
                        Text(article.title)
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 4) {
                            Text("By")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            Text(article.author ?? "Unknown")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
                            Text("·")
                                .foregroundColor(.gray)
                            Text(article.source.name)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                        
                        HStack(spacing: 8) {
                            Text("Business")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.gray)
                            
                            Text("•")
                                .foregroundColor(.gray)
                            
                            Text(article.publishedAt.readableString)
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            HStack(spacing: 4) {
                                Image(systemName: "hand.thumbsup")
                                    .font(.system(size: 13))
                                    .foregroundColor(.blue)
                                Text("2.5k")
                                    .font(.system(size: 13))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Text(article.articleDescription ?? "No description available.")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .lineSpacing(6)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    
                    
                }
                .ignoresSafeArea(edges: .top)
                .padding(.top, 5).padding(.horizontal,12).frame(maxWidth: .infinity, alignment: .leading)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
        }
    }
}
