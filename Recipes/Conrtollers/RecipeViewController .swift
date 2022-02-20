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
        recipeView.tableVIew.delegate = self
        recipeView.tableVIew.dataSource = self
      
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
                self.recipeView.tableVIew.reloadData()
//              var viewElemnts = RecipeDetailUIView()
////              print("Я ЕбЛАН ААААААААААЫФФФФФФФФФ")
//              self.recipeView.sampleLabel.text = String(recipe.title) // done
//              self.recipeView.recipeImageView.sd_setImage(with: URL(string: "\(recipe.image)")) // done
//              self.test = (recipe.analyzedInstructions[0].steps[0].step.count)
//
//              self.recipeView.valuheOne = (recipe.analyzedInstructions[0].steps[0].ingredients[0].name.count) //Крч это переменые для количества ячеек
//              self.recipeView.valueTwo = recipe.analyzedInstructions[0].steps.count //Крч это переменые для количества ячеек
//
//
//              self.recipeView.resipeText = recipe.analyzedInstructions[0].steps[0].ingredients[0].name // Не получаеться почему то получить данные в массиве, постоянно ругаться типо кол-во ячеек и элементов не !=. Просто написал это, чтобы таблица заполнялась
//
//
//              self.recipeView.recipe = recipe
//              self.recipeView.tableVIew.reloadData()
//              // Бывает падает из-за того шо нет номера или просто битая апи приходит
            }
        })
    }

    // MARK: - Methods for UI configuration.
    
    private func setUpView() {
        self.tabBarController?.tabBar.isHidden = true
    }
}





extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {


      func numberOfSections(in tableView: UITableView) -> Int {
          2
      }

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          guard let recipe = recipe else { return 0}
          if section == 0 {
              return recipe.extendedIngredients.count
          }else {
              return recipe.analyzedInstructions[0].steps.count
          }
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let recipe = recipe else { return UITableViewCell()}
          let ingredients = recipe.extendedIngredients[indexPath.row]
          let stepsOfPreparations = recipe.analyzedInstructions[0].steps[indexPath.section]
          
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
          if indexPath.section == 0 {
              cell.textLabel?.text = ingredients.originalName
          }else{
              cell.textLabel?.text = stepsOfPreparations.step
          }
          return cell
      }

      func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          if section == 0 {
              return 50
          }else {
              return 100
          }
      }

      func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
          if section == 0 {
              return 20
          } else {
              return 20
          }
      }

      func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          if section == 0 {
              return "ingredients"
          }else {
              return "steps"
          }
      }




    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
      let header = view as! UITableViewHeaderFooterView
      header.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)

    }

  }



