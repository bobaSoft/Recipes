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
    
    let recipeURl = "https://api.spoonacular.com/recipes/complexSearch"
    let recipeIdURL = "https://api.spoonacular.com/recipes/information"
    
    static let shared = NetworkRequestManager()
    private init?() {}
    
    //MARK:  - Создание запроса
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
    
    //MARK: - Параметры запроса
    private func generateParamsForRecipes(keyWord: String?)->[String:String]{
        var parameters = [String:String]()
        parameters["query"] = keyWord
        parameters["apiKey"] = "7002e98af1174da7a201c458e407023d" // ключ может упасть
        parameters["number"] = String(30)
        return parameters
    }
    
    
    
    let parameters = ["apiKey": "7002e98af1174da7a201c458e407023d"]
    
    
    
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

