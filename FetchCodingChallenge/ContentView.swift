//
//  ContentView.swift
//  FetchCodingChallenge
//
//  Created by Grace Yang on 6/5/23.
//

import SwiftUI

struct MealRow: View {
    let meal: Meal
    
    var body: some View {
        HStack {
            URLImage(urlString: meal.strMealThumb)
            .frame(width:130, height:70)
            
            Text(meal.strMeal)
                .bold()
        }
    }
}

struct ContentView: View {
    @StateObject var mealViewModel = MealViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(mealViewModel.meals, id:\.self) { meal in
                    NavigationLink(destination: RecipeView(meal: meal)) {
                        MealRow(meal: meal)
                    }
                }
            }
            .navigationTitle("Desserts")
            .onAppear() {
                mealViewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
