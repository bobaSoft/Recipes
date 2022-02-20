//
//  NetworkRequestManager.swift
//  Recipes
//
//  Created by Kirill Drozdov on 13.02.2022.
//

import Alamofire
import SwiftyJSON


//MARK:  - NetworkRequestManager
class NetworkRequestManager{

  let recipeURl = "https://api.spoonacular.com/recipes/complexSearch" // URL first
  let recipeIdURL = "https://api.spoonacular.com/recipes/information" // URL second

  static let shared = NetworkRequestManager() // Singleton
  private init?() {}

  //MARK: - Первый запрос(получение рецептов)
  /// - Создание запроса для первого экрана
  func request(searchWord: String?, completion: @escaping ([RecipesResult]) -> Void) {
    let parameters = generateParamsForRecipes(keyWord: searchWord)
    guard let url = URL(string: recipeURl) else {return}

    AF.request(url, method: .get, parameters: parameters).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        guard let recipes = RecipesResult.getArray(from: value) else { return }
        completion(recipes)
      case .failure(let error):
        print("HTTP REQEST ERROR:\(error.localizedDescription)")
      }
    }
  }

  /// - Параметры запроса  для первого экрана
  private func generateParamsForRecipes(keyWord: String?)->[String:String]{
    var parameters = [String:String]()
    parameters["query"] = keyWord
    parameters["apiKey"] = "c2ab68bc2ddd40cd950a6f5ad60aa263" // ключ может упасть
    parameters["number"] = String(30)
    return parameters
  }


  //MARK: - Второй запрос на детальном экране рецепта
  /// - Параметры запроса  для второго экрана
  let parameters = ["apiKey": "c2ab68bc2ddd40cd950a6f5ad60aa263"]

  /// - Создание запроса для второго экрана
  func requestRecipes(id:Int, comletion: @escaping(_ recipe: Recipe)->Void) {
    let url = "https://api.spoonacular.com/recipes/\(id)/information"
    AF.request(url, parameters: parameters).validate().responseDecodable(of: Recipe.self) { response in
      switch response.result {
      case .success(let value):
        comletion(value)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}

