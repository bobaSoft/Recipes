//
//  Recipe.swift
//  Recipes
//
//  Created by Михаил Бобров on 17.02.2022.
//

import Foundation

struct Recipe: Codable {
    let id: Int
    let title: String
    let readyInMinutes: Int
    let image: String
    let instructions: String
    let analyzedInstructions: [AnalyzedInstruction]
}

struct AnalyzedInstruction: Codable {
    let name: String
    let steps: [Step]
}

struct Step: Codable {
    let number: Int
    let step: String
    let ingredients: [StepIngredient]
}

struct StepIngredient: Codable {
    let id: Int
    let name: String
    let localizedName: String
    let image: String
}
