//
//  HomeView.swift
//  Cooklet
//
//  Created by Nxtwave on 18/07/25.
//

import Foundation
import SwiftUI
import Combine

struct HomeView: View  {
    @StateObject private var viewModel = RecipeView()
    @StateObject private var viewmodel = GoogleAuthViewModel()
    
    @State var favoriteRecipes: [Recipe] = []
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var index: Int = 0
    @State private var profile: Bool = false
    @State private var showMainView = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.black,.gray]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    .fullScreenCover(isPresented: $showMainView) {
                        MainView()
                    }
                VStack{
                    ScrollView{
                        HStack(spacing: 10){
                            Image("logo")
                                .resizable()
                                .frame(width:50, height: 50)
                                .cornerRadius(70)
                            Spacer()
                            
                            Button {
                                profile.toggle()
                            } label: {
                                Image(systemName: "line.3.horizontal")
                                    .resizable()
                                    .frame(width:30, height: 20)
                                    .foregroundStyle(.white)
                            }
                            if profile {
                                VStack {
                                   Text("Settings")
                                        .foregroundColor(.white)
                                    Button {
                                        viewmodel.signOut()
                                        showMainView = true
                                    } label: {
                                        Text("Logout")
                                                .foregroundColor(.white)
                                    }
                                
                                }
                                .padding()
                            }
                        }
                        .padding()
                        
                        Text("Trending Recipes")
                            .font(.system(size: 25, weight: .bold, design: .default))
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .padding(.trailing,160)
                        ScrollViewReader { proxy in
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(viewModel.trendingRecipes) { recipe in
                                        NavigationLink(destination: RecipeDetailView(recipe: recipe, favoriteRecipes: $favoriteRecipes)) {
                                            TrendingCard(recipe: recipe, favoriteRecipes: $favoriteRecipes)
                                        }
                                    }
                                }
                            }
                            .task { await viewModel.fetchTrendingRecipes() }
                            .onReceive(timer) { _ in
                                index += 1
                                if index >= viewModel.trendingRecipes.count {
                                    index = 0
                                }
                                withAnimation(.linear(duration: 0.5)) {
                                    proxy.scrollTo(index)
                                }
                            }
                        }
                        Text("Top Chef's")
                            .font(.system(size: 25, weight: .bold, design: .default))
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .padding(.trailing,230)
                            .padding()
                        VStack{
                            ScrollView(.horizontal){
                                HStack{
                                    ChefDataView()
                                }
                            }
                        }
                        Text("Liked Recipes")
                            .font(.system(size: 25, weight: .bold, design: .default))
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .padding(.trailing,200)
                        
                        LikedRecipesView(favoriteRecipes: $favoriteRecipes)
                     
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView(favoriteRecipes: [])
}
