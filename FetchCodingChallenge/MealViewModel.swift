//
//  MealViewModel.swift
//  FetchCodingChallenge
//
//  Created by Mary Emerald on 6/5/23.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []

    func fetch() {
        //get desserts endpoint
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {return}
        
        //call api
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            
            //convert to JSON
            do {
                let mealsAry = try JSONDecoder().decode(MealAry.self, from: data)
                DispatchQueue.main.async {
                    self?.meals = mealsAry.meals
                }
            }
            catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
