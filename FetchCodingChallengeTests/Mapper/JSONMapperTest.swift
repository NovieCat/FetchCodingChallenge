//
//  JSONMapperTest.swift
//  FetchCodingChallengeTests
//
//  Created by Mary Emerald on 6/7/23.
//

import Foundation
import XCTest
@testable import FetchCodingChallenge

class JSONMapperTests: XCTestCase {
    var mealViewModel = MealViewModel()
    var recipeViewModel = RecipeViewModel(meal: .init(idMeal: "", strMeal: "", strMealThumb: ""))

    func readLocalJsonFile(resource: String) -> Data? {
        do {
            guard let fileURL = Bundle.main.url(forResource: resource, withExtension: "json") else {return nil}
            let data = try Data(contentsOf: fileURL)
            return data
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
    }

    func test_valid_meal_json() {
        //should not throw error and successfully decode
        guard let jsonData = readLocalJsonFile(resource: "DessertValid") else {return}
        mealViewModel.decodeJson(data: jsonData)
        XCTAssert(!mealViewModel.meals.isEmpty)
    }
    
    func test_valid_recipe_json() {
        //should not throw error and successfully decode
        guard let jsonData = readLocalJsonFile(resource: "Meal53049Valid") else {return}
        recipeViewModel.decodeJson(data: jsonData)
        XCTAssert(recipeViewModel.recipe != nil)
    }
}
