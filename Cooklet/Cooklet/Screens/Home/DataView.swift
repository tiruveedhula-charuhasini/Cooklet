//
//  DataView.swift
//  Cooklet
//
//  Created by Nxtwave on 23/07/25.
//

import Foundation
import Combine
import SwiftUI

struct Chef: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}

class DataView: ObservableObject {
   
        @Published var chefs: [Chef] = []
        
        func loadChefs() {
            guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
                print(" Could not find data.json")
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decodedChefs = try JSONDecoder().decode([Chef].self, from: data)
                self.chefs = decodedChefs
            } catch {
                print("Failed to load or decode data: \(error)")
            }
        }
    }


