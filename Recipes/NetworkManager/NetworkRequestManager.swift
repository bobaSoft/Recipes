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
  func request(searchWord: String, cumletion: @escaping ([RecipesResult]) -> Void) {
    let parameters = generateParams(keyWord: searchWord)
    guard let url = URL(string: url) else {return}


    AF.request(url, method: .get, parameters: parameters)
      .validate(statusCode: 200..<300)
      .responseJSON() {response in
          guard let value = response.value else { return }
          guard let valueDict = value as? Dictionary<String,Any> else {return}
          guard let arrayJSON = valueDict["results"] as? Array<[String:Any]> else {return}
          var array: [RecipesResult] = []
          for i in arrayJSON {
              guard let id = i["id"] as? Int,
                    let title = i["title"] as? String,
                    let image = i["image"] as? String else {return}
              let recipe = RecipesResult(id: id, title: title, image: image)
              
              array.append(recipe)
           }
//          print(array)
          cumletion(array)
          
        }

      }

  //MARK: - Параметры запроса
 private func generateParams(keyWord: String?)->[String:String]{
    var parameters = [String:String]()
    parameters["query"] = keyWord
    parameters["apiKey"] = "9a3400a2b3354a5785de5d3c09c7160b"
    parameters["number"] = String(30)
    return parameters
  }


}








//static func parseJSON(withData data: Data) -> [Valute]? {
//
//            var valutes = [Valute]()
//
//            let decoder = JSONDecoder()
//
//
//
//            do{
//
//                let jsonData = try decoder.decode(ValuteData.self, from: data)
//
//                if let jsonItems = jsonData.valute {
//
//                    for item in jsonItems {
//
//                        let valute = item.value
//
//                        valutes.append(valute)
//
//                    }
//
//                }
//
//                return valutes
//
//            }catch let error as NSError {
//
//                print(error.localizedDescription)
//
//            }
//
//            return nil
//
//        }
