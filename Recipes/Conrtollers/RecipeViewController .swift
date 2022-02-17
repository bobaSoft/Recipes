//
//  RecipeViewController .swift
//  Recipes
//
//  Created by Kirill Drozdov on 16.02.2022.
//

import Foundation
import UIKit
import SnapKit

class RecipeViewController: UIViewController  {


  var recipe: Recipe?
  var dish: String?

  private let scrollView  =   UIScrollView()
  private let contentView =   UIView()
  private let label2      =   UILabel()
  private let label1      =   UILabel()





  func fetchData(id: Int){
      NetworkRequestManager.shared?.requestRecipes(id: id, comletion: { recipe in
          DispatchQueue.main.async {
              self.recipe = recipe
              self.label1.text = recipe.title
              self.label2.text = recipe.analyzedInstructions[0].steps[0].step
              
              print("\(self.recipe!.readyInMinutes) заебись рецепт прям ахуеваю")
          }
      })
}
    



  override func viewDidLoad() {
    super.viewDidLoad()
    self.tabBarController?.tabBar.isHidden = true
    settingsViewElements()

    DispatchQueue.main.async { [self] in
      print("recipe ===== \(recipe)")
      
  }


    view.backgroundColor  = .blue
    title = dish
  }


  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // print recipe
  }



  private func settingsViewElements(){
    view.addSubview(scrollView)
    scrollView.snp.makeConstraints { (make) in
      make.edges.equalTo(view)
    }
           contentView.addSubview(label1)
           label1.numberOfLines = 0


    scrollView.addSubview(contentView)
    contentView.snp.makeConstraints { (make) in
      make.top.bottom.equalTo(scrollView)
      make.left.right.equalTo(view)
    }


           contentView.addSubview(label2)
           label2.numberOfLines = 0
           label2.text = "sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds sdlkfj lksjdf lksjd flksdjf slkd jfdslkjf kldsjf lksdj fklsdjf lkdsjf lkjsdlk fjsdlkf jsdlkj flksdjflksdjf lksdj flkjsdlk fjsldkjf lkdjflksjdlksjf lkdsj flkdsjf lkds"

    contentView.addSubview(label1)
    label1.numberOfLines = 0
    label1.text = "hi"

    label1.snp.makeConstraints { (make) in
      make.left.right.equalTo(contentView).inset(20)
      make.top.equalTo(contentView).offset(20)
    }

    contentView.addSubview(label2)
    label2.numberOfLines = 0
    label2.text = "sflksdjfflk kd jfdslkjf kldsjf l"

    label2.snp.makeConstraints { (make) in
      make.left.right.equalTo(contentView).inset(20)
      make.top.equalTo(label1.snp.bottom).offset(20)
      make.bottom.equalTo(contentView).offset(-20)
    }
  }


//  func fetchData(id: Int){
//    NetworkRequestManager.shared?.requestRecipes(id: id, comletion: { response in
//      DispatchQueue.main.async { [self] in
//        self.recipe = response
//        label1.text = recipe[0]
//      }
//    })
//    view.backgroundColor  = .blue
//    title = dish
//  }

}
