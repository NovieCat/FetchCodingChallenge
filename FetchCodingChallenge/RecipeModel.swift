//
//  RecipeModel.swift
//  FetchCodingChallenge
//
//  Created by Mary Emerald on 6/6/23.
//

import Foundation

struct Ingredient: Decodable, Hashable {
    let name: String
    let measure: String
}

struct Recipe: Decodable {
    let name: String
    let imgURL: String
    let instructions: String
    let ingredients: [Ingredient]
}

extension Recipe {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let recipeDictionary = try container.decode([String: String?].self)
        
        name = recipeDictionary["strMeal"] as? String ?? ""
        imgURL = recipeDictionary["strMealThumb"] as? String ?? ""
        instructions = recipeDictionary["strInstructions"] as? String ?? ""
        
        var index = 1
        var ingredients: [Ingredient] = []
        
        while let ingredient = recipeDictionary["strIngredient\(index)"] as? String,
              let measure = recipeDictionary["strMeasure\(index)"] as? String,
              !ingredient.isEmpty, !measure.isEmpty {
            ingredients.append(.init(name: ingredient, measure: measure))
            index += 1
        }
        
        self.ingredients = ingredients
        
    }
}

struct RecipeAry: Decodable {
    let meals: [Recipe]
}
