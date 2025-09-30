//
//  TrendingCard.swift
//  Cooklet
//
//  Created by Nxtwave on 24/07/25.
//

import SwiftUI

struct TrendingCard: View {
    let recipe: Recipe
    @Binding var favoriteRecipes: [Recipe]
    var body: some View {
        HStack(spacing: 10){
            CacheImage(url: recipe.image, width: 150, height: 160)
                .cornerRadius(10)
            VStack(alignment: .leading){
                Text(recipe.name)
    
                    .font(.headline)
                    .foregroundColor(.white)
                Text(recipe.cuisine)
                    .font(.caption)
                    .foregroundColor(.black)
                    .padding(.trailing,100)
                Text("⭐️ \(String(format: "%.1f", recipe.rating))  •  \(recipe.difficulty.rawValue)")
                    .font(.caption)
                    .foregroundColor(.orange)
                
                NavigationLink(destination: RecipeDetailView(recipe: recipe, favoriteRecipes: $favoriteRecipes)){
                    Text("Detailed Recipe")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .frame(width: 125, height: 30)
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding()
                }
            }
        }
        .frame(width: 375, height: 200)
        .background(.black.opacity(0.3))
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 3)
        )
        .cornerRadius(15)
        .padding()
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var favorites: [Recipe] = []
        var body: some View {
            TrendingCard(recipe: Recipe(
                id: 1,
                name: "Classic Margherita Pizza",
                ingredients: ["Pizza dough", "Tomato sauce", "Fresh mozzarella cheese", "Fresh basil leaves", "Olive oil", "Salt and pepper to taste"],
                instructions: ["Preheat the oven to 475°F (245°C).", "Roll out the pizza dough and spread tomato sauce evenly.", "Top with slices of fresh mozzarella and fresh basil leaves.", "Drizzle with olive oil and season with salt and pepper.", "Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.", "Slice and serve hot."],
                prepTimeMinutes: 20,
                cookTimeMinutes: 15,
                servings: 4,
                difficulty: .easy,
                cuisine: "Italian",
                caloriesPerServing: 300,
                tags: ["Pizza", "Italian"],
                userID: 166,
                image: "https://cdn.dummyjson.com/recipe-images/1.webp",
                rating: 4.6,
                reviewCount: 98,
                mealType: ["Dinner"]
            ), favoriteRecipes: $favorites)
        }
    }
    return PreviewWrapper()
}


