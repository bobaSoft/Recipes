//
//  ViewController.swift
//  Recipes
//
//  Created by Михаил Бобров on 13.02.2022.
//

import UIKit

class ViewController: UIViewController {

  var recipe = [RecipesResult]()

  override func viewDidLoad() {
    super.viewDidLoad()

      NetworkRequestManager.shared?.request(searchWord: "pasta", cumletion: { recipes in
          let array = recipes
          
          DispatchQueue.main.async {
              self.recipe = array
              print(self.recipe)
          }
      })
    print("Hello world")

  }

}

