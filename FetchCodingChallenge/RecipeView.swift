//
//  RecipeView.swift
//  FetchCodingChallenge
//
//  Created by Mary Emerald on 6/6/23.
//

import SwiftUI

struct RecipeIngredients: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ingredients")
            .bold()
            
            ForEach(recipe.ingredients, id:\.self) { ingredient in
                HStack {
                    Text(ingredient.measure)
                    Text(ingredient.name)
                }
            }
        }
    }
}

struct RecipeInstructions: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Instructions")
            .bold()
            Text(recipe.instructions)
        }
    }
}

struct RecipeView: View {
    @ObservedObject var recipeViewModel: RecipeViewModel
    
    init(meal: Meal) {
        self.recipeViewModel = RecipeViewModel(meal: meal)
    }
    
    var body: some View {
        self.recipeViewModel.recipe.map { recipe in
            ScrollView {
                URLImage(urlString: recipe.imgURL)
                .frame(width:300, height:300)
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    RecipeIngredients(recipe: recipe)
                    Divider()
                    RecipeInstructions(recipe: recipe)
                }
            }
            .navigationTitle(recipe.name)
            .padding(20)
            .onAppear() {
                recipeViewModel.fetch()
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
