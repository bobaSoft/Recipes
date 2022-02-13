//
//  ViewController.swift
//  Recipes
//
//  Created by Михаил Бобров on 13.02.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      downloadJSON()

    }

  var araayElemnts = [String]()

  private func downloadJSON(){
    let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?cuisine=Indian&apiKey=d0d03c927c034a62af87be5f7ab71334&number=113")
    AF.request(url!, method: .get).validate().responseJSON { [self] response in
      switch response.result {

      case .success(let value):
        let json = JSON(value)

        let test = json["results"][0]["image"] // адрес фотки
        print("JSON == \(test)") // вывод адреса фотки

        let titles = json["results"].arrayValue.map{$0["title"].stringValue} // получение всех titles
        let id = json["results"].arrayValue.map{$0["id"].stringValue}       // получение всез id

        // add array
        araayElemnts = titles

      case .failure(let error):
        print("Ошибка == \(error)")
      }

      print(araayElemnts.count) // тут приходит 100
      print(araayElemnts)      // тут приходят все title


    }
  }

}


