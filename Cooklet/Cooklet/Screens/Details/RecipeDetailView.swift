import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @Binding var favoriteRecipes: [Recipe]
    @State private var showLikedRecipes = false
    
    var isFavourite: Bool {
        favoriteRecipes.contains(where: { $0.id == recipe.id })
    }
    
    private func toggleFavorite() {
        if let index = favoriteRecipes.firstIndex(where: { $0.id == recipe.id }) {
            favoriteRecipes.remove(at: index)
        } else {
            favoriteRecipes.append(recipe)
            print("Favourites now:", favoriteRecipes.map(\.name))
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .gray]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ZStack(alignment: .topTrailing) {
                        
                        CacheImage(url: recipe.image, width: 400, height: 250)
                            
                  
                        HStack {
                            Spacer()
                                                        
                            Button {
                                toggleFavorite()
                            } label: {
                                Image(systemName: isFavourite ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 20, height: 18)
                                    .foregroundColor(isFavourite ? .red : .white)
                                    .padding(10)
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                                    .shadow(radius: 3)
                                    .padding()
                            }
                        }
                    }
                    
                    HStack(spacing: 12) {
                        InfoCard(icon: "clock", title: "Cooking time", value: "\(recipe.cookTimeMinutes) mins")
                        InfoCard(icon: "crown", title: "Difficulty", value: recipe.difficulty.rawValue)
                        InfoCard(icon: "fork.knife", title: "Servings", value: "\(recipe.servings) people")
                    }
                    .padding(.horizontal)
                    
                    Divider().padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Ingredients")
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding(.bottom, 4)
                        
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            Text("• \(ingredient)")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider().padding(.horizontal)
                        .lineLimit(1)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Instructions")
                            .font(.title2)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .padding(.bottom, 4)
                        
                        ForEach(recipe.instructions.indices, id: \.self) { index in
                            Text("\(index + 1). \(recipe.instructions[index])")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                    
                   
                }
            }
            .navigationTitle(recipe.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct InfoCard: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.black)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    RecipeDetailView(
        recipe: Recipe(
            id: 1,
            name: "Classic Margherita Pizza",
            ingredients: ["Pizza dough", "Tomato sauce", "Fresh mozzarella cheese", "Fresh basil leaves", "Olive oil", "Salt and pepper to taste"],
            instructions: [
                "Preheat the oven to 475°F (245°C).",
                "Roll out the pizza dough and spread tomato sauce evenly.",
                "Top with slices of fresh mozzarella and fresh basil leaves.",
                "Drizzle with olive oil and season with salt and pepper.",
                "Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.",
                "Slice and serve hot."
            ],
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
        ),
        favoriteRecipes: .constant([])
    )
}


