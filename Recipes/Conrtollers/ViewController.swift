//
//  ViewController.swift
//  Recipes
//
//  Created by Михаил Бобров on 13.02.2022.
//

import UIKit

class ViewController: UIViewController {

  var recipes = [RecipesResult]()

  override func viewDidLoad() {
    super.viewDidLoad()
      
      view.backgroundColor = .white
      NetworkRequestManager.shared?.request(searchWord: "Pizza", completion: { recipes in
          DispatchQueue.main.async {
              print(recipes)
          }
      })
      
    print("Hello world")

  }

}

