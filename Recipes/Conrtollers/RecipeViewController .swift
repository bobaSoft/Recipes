//
//  RecipeViewController .swift
//  Recipes
//
//  Created by Kirill Drozdov on 16.02.2022.
//

import UIKit

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
            }
        })
    }
    

    
    
    // MARK: - Methods for UI configuration.
    
    private func setUpView() {
        self.tabBarController?.tabBar.isHidden = true
    }
}
