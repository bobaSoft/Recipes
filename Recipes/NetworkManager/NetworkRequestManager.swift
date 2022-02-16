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
    
    let url = "https://api.spoonacular.com/recipes/complexSearch"
    
    static let shared = NetworkRequestManager()
    private init?() {}
    
    //MARK:  - Создание запроса
    func request(searchWord: String?, completion: @escaping ([RecipesResult]) -> Void) {
        let parameters = generateParams(keyWord: searchWord)
        guard let url = URL(string: url) else {return}
        
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
    private func generateParams(keyWord: String?)->[String:String]{
        var parameters = [String:String]()
        parameters["query"] = keyWord
      parameters["apiKey"] = "9a3400a2b3354a5785de5d3c09c7160b" // ключ может упасть
        parameters["number"] = String(30)
        return parameters
    }

  var araayElemnts = [String]()

  func requestRecipes(id:Int, comletion: @escaping(([String])->Void)){
    let url = URL(string: "https://api.spoonacular.com/recipes/\(id)/information?includeNutrition=true&apiKey=9a3400a2b3354a5785de5d3c09c7160b")
      AF.request(url!, method: .get).validate().responseJSON { [self] response in
        switch response.result {

        case .success(let value):
          let json = JSON(value)

          let test = json["extendedIngredients"][0] // адрес фотки
          print("JSON------------------ == \(test)") // вывод адреса фотки

          let titles = json["extendedIngredients"].arrayValue.map{$0["name"].stringValue} // получение всех name
          // add array
          
          araayElemnts = titles
          comletion(araayElemnts)

        case .failure(let error):
          print("Ошибка == \(error)")
        }
        print(araayElemnts)      // тут приходят все title

      }
  }

  func downloadJSON(id:Int){

    }
  }
    
    


