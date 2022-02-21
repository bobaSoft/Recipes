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
  private let firstCellIDF = "RightChatCellIDF"
  private var recipe: Recipe? {
    didSet {
      guard let recipe = recipe, let url = URL(string:recipe.image) else { return }
      self.recipeView.recipeNameLabel.text = recipe.title
      DispatchQueue.main.async {
        self.recipeView.recipeImageView.sd_setImage(with: url)
      }
    }
  }
  
  /// recipeView -> RecipeDetailUIView
  private lazy var recipeView = RecipeDetailUIView()
  
  /// viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpView()
    recipeView.customTableView.delegate = self
    recipeView.customTableView.dataSource = self
    recipeView.customTableView.register(IngredientsCell().classForCoder, forCellReuseIdentifier: firstCellIDF)
  }
  
  /// viewWillAppear
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    recipeView.customTableView.reloadData()
  }
  
  /// loadView
  override func loadView() {
    self.view = recipeView
  }
  
  /// viewWillLayoutSubviews
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
        self.recipeView.customTableView.reloadData()
      }
    })
  }
  
  // MARK: - Methods for UI configuration.
  private func setUpView() {
    self.tabBarController?.tabBar.isHidden = true // скрыть tabBar
  }
}


//MARK: - UITableViewDelegate
extension RecipeViewController: UITableViewDelegate {
  /// heightForHeaderInSection
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 0 {
      return 50
    }else {
      return 100
    }
  }
  
  /// heightForFooterInSection
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    if section == 0 {
      return 20
    } else {
      return 20
    }
  }
  
  /// willDisplayHeaderView
  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    let header = view as! UITableViewHeaderFooterView
    header.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    
  }
}

//MARK: - UITableViewDataSource
extension RecipeViewController: UITableViewDataSource{
  /// numberOfSections
  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }
  
  /// numberOfRowsInSection
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let recipe = recipe else { return 0}
    if section == 0 {
      return recipe.extendedIngredients.count
    }else {
      return recipe.analyzedInstructions[0].steps.count
    }
  }
  
  /// cellForRowAt
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let recipe = recipe else { return UITableViewCell()}
    
    if indexPath.section == 0 {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      let ingredients = recipe.extendedIngredients[indexPath.row]
      cell.textLabel?.text = ingredients.originalName
      print("ID IMAGE - \(ingredients.id) Ingredients name - \(ingredients.originalName)")
      return cell
      
    }else{
      
      let cell = tableView.dequeueReusableCell(withIdentifier:firstCellIDF , for: indexPath) as! IngredientsCell
      let stepsOfPreparations = recipe.analyzedInstructions[0].steps[indexPath.row]
      cell.ConfigCellWithContain(stepsOfPreparations)
      return cell
    }
  }
  
  /// titleForHeaderInSection
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return "ingredients"
    }else {
      return "steps"
    }
  }
}




