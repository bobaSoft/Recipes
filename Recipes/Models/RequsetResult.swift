//
//  RequsetResult.swift
//  Recipes
//
//  Created by Kirill Drozdov on 13.02.2022.
//

import Foundation

struct RequsetResult: Codable {
  let results: [RecipesResult]?
}


struct RecipesResult: Codable {
  let id: Int
  let title: String
  let image: String



}
