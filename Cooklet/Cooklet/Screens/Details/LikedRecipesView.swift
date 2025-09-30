//
//  LikedRecipesView.swift
//  Cooklet
//
//  Created by Nxtwave on 13/08/25.

import SwiftUI

struct LikedRecipesView: View {
    @Binding var favoriteRecipes: [Recipe]
    let gridItems: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
            
            VStack {
                if favoriteRecipes.isEmpty {
                    Text("No favorite recipes found")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: gridItems, spacing: 16) {
                            ForEach(favoriteRecipes, id: \.id) { recipe in
                                NavigationLink(destination: RecipeDetailView(recipe: recipe, favoriteRecipes: $favoriteRecipes)) {
                                    VStack {
                                        CacheImage(url:  recipe.image, width: 120, height: 130)
                                            .cornerRadius(10)
                                            
                                        
                                        Text(recipe.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .padding(.top, 4)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }



