//
//  MealModel.swift
//  FetchCodingChallenge
//
//  Created by Mary Emerald on 6/5/23.
//

import Foundation

struct Meal: Decodable, Hashable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}

struct MealAry: Decodable {
    let meals: [Meal]
}
