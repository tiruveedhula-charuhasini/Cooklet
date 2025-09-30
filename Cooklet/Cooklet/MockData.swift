//
//  MockData.swift
//  Cooklet
//
//  Created by Nxtwave on 22/07/25.
//

import Foundation
import Combine
import SwiftUI

struct Category: Identifiable {
    
    let id = UUID()
    let image: String
    let title: String
}

struct Welcome: Codable {
    let recipes: [Recipe]
    let total, skip, limit: Int
}

struct Recipe: Codable, Identifiable {
    let id: Int
    let name: String
    let ingredients, instructions: [String]
    let prepTimeMinutes, cookTimeMinutes, servings: Int
    let difficulty: Difficulty
    let cuisine: String
    let caloriesPerServing: Int
    let tags: [String]
    let userID: Int
    let image: String
    let rating: Double
    let reviewCount: Int
    let mealType: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, ingredients, instructions, prepTimeMinutes, cookTimeMinutes, servings, difficulty, cuisine, caloriesPerServing, tags
        case userID = "userId"
        case image, rating, reviewCount, mealType
    }
}

enum Difficulty: String, Codable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}




                            





