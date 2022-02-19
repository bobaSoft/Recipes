//
//  RecipeViewController .swift
//  Recipes
//
//  Created by Kirill Drozdov on 16.02.2022.
//

import UIKit
import SDWebImage

class RecipeViewController: UIViewController  {
    
    // MARK: - Private properties
    
    private var recipe: Recipe?
    
    private lazy var recipeView = RecipeDetailUIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
      
    }
    
    override func loadView() {
        self.view = recipeView
//      recipeView.sampleLabel.text = "ПЕНА ИДИКА ТЫ НАХУЙ"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        recipeView.recipeImageView.snp.makeConstraints { make in
            make.height.equalTo(self.view.frame.height / 3)
          make.width.equalTo(self.view.frame.width * 0.7)
        }
    }
    
    // MARK: - Network.
    
    func fetchData(id: Int){
        NetworkRequestManager.shared?.requestRecipes(id: id, comletion: { recipe in
            DispatchQueue.main.async {
                self.recipe = recipe
                print(self.recipe)
              var viewElemnts = RecipeDetailUIView()
//              print("Я ЕбЛАН ААААААААААЫФФФФФФФФФ")
              self.recipeView.sampleLabel.text = String(recipe.title) // done
              self.recipeView.recipeImageView.sd_setImage(with: URL(string: "\(recipe.image)")) // done

              self.recipeView.valuheOne = (recipe.analyzedInstructions[0].steps[0].ingredients[0].name.count) //Крч это переменые для количества ячеек
              self.recipeView.valueTwo = recipe.analyzedInstructions[0].steps.count //Крч это переменые для количества ячеек


              self.recipeView.resipeText = recipe.analyzedInstructions[0].steps[0].ingredients[0].name // Не получаеться почему то получить данные в массиве, постоянно ругаться типо кол-во ячеек и элементов не !=. Просто написал это, чтобы таблица заполнялась


              self.recipeView.recipe = recipe
              self.recipeView.tableVIew.reloadData()
              // Бывает падает из-за того шо нет номера или просто битая апи приходит
            }
        })
    }
    

    
    
    // MARK: - Methods for UI configuration.
    
    private func setUpView() {
        self.tabBarController?.tabBar.isHidden = true
    }
}
