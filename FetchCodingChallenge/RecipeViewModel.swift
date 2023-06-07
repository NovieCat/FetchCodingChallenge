//
//  RecipeViewModel.swift
//  FetchCodingChallenge
//
//  Created by Mary Emerald on 6/6/23.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipe: Recipe?
    
    let meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
        fetch()
    }
    
    func fetch() {
        //get desserts endpoint
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(meal.idMeal)") else {return}
        
        //call api
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            
            //convert to JSON
            do {
                let recipesAry = try JSONDecoder().decode(RecipeAry.self, from: data)
                DispatchQueue.main.async {
                    self?.recipe = recipesAry.meals.first
                }
            }
            catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
