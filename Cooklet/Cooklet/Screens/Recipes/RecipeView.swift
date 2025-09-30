//
//  RecipeView.swift
//  Cooklet
//
//  Created by Nxtwave on 23/07/25.
//

import Foundation
import Combine

@MainActor
class RecipeView: ObservableObject {
    @Published var trendingRecipes: [Recipe] = []
    
    private let cacheFileName = "trendingRecipes.json"
    
    init() {
        loadFromCache()
    }
    
    func fetchTrendingRecipes() async {
        guard let url = URL(string: "https://dummyjson.com/recipes") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(Welcome.self, from: data)
            trendingRecipes = decoded.recipes
            
            saveToCache(data)
            print(" Fetched from API & cached to file")
        } catch {
            print("Failed to fetch recipes:", error)
        }
    }
    
    private func saveToCache(_ data: Data) {
        let fileURL = getCacheFileURL()
        do {
            try data.write(to: fileURL)
        } catch {
            print("Failed to write cache file:", error)
        }
    }
    
    private func loadFromCache() {
        let fileURL = getCacheFileURL()
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoded = try JSONDecoder().decode(Welcome.self, from: data)
                trendingRecipes = decoded.recipes
                print("Loaded from file cache")
            } catch {
                print("Failed to load cache file:", error)
            }
        }
    }
    
    private func getCacheFileURL() -> URL {
        let documents = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return documents.appendingPathComponent(cacheFileName)
    }
}


