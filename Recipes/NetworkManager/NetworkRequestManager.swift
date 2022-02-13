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
  func request(searchWord: String, comletion: @escaping ([RecipesResult]) -> Void) {
    let parameters = generateParams(keyWord: searchWord)
    guard let url = URL(string: url) else {return}


    AF.request(url, method: .get, parameters: parameters)
      .validate(statusCode: 200..<300)
      .responseDecodable(of: RequsetResult.self){response in
        var recip: [RecipesResult] = []
        guard let value = response.value else {return}
        if let array = value.results {
          for i in array {
            recip.append(i)
          }
comletion(recip)
        }

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
