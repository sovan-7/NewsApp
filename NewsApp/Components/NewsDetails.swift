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
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(.black)
                                        .padding(10)
                                        .background(Color(.systemGray6))
                                        .clipShape(Circle())
                                }

                                Spacer()

                                Text("News Details")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.black)

                                Spacer()

                                // Invisible placeholder to balance the HStack
                                Circle()
                                    .fill(Color.clear)
                                    .frame(width: 38, height: 38)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color.white)

                // MARK: - Hero Image
                AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 220)
                        .clipped()
                } placeholder: {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color(.systemGray5))
                        .frame(maxWidth: .infinity)
                        .frame(height: 220)
                        .overlay(ProgressView())
                }

                // MARK: - Text Content
                VStack(alignment: .leading, spacing: 12) {
                    
                    // Title
                    Text("jfdhj")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Byline
                    HStack(spacing: 4) {
                        Text("By")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                        Text("Author")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.primary)
                        Text("For")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                        Text("Publication")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.primary)
                    }
                    
                    // Meta Row
                    HStack(spacing: 8) {
                        Text("Business")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.blue)
                        
                        Text("•")
                            .foregroundColor(.secondary)
                        
                        Text("2h")
                            .font(.system(size: 13))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            Image(systemName: "hand.thumbsup")
                                .font(.system(size: 13))
                                .foregroundColor(.secondary)
                            Text("2.5k")
                                .font(.system(size: 13))
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    
                    // Body Text
                    Text(article.articleDescription ?? "")
                        .font(.system(size: 16))
                        .foregroundColor(.primary)
                        .lineSpacing(6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 16)
            }
        }
        .ignoresSafeArea(edges: .top).padding(.top, 5)
    }
}


