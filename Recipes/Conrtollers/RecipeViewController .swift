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
    
    private var recipe: Recipe? {
        didSet {
            guard let recipe = recipe, let url = URL(string:recipe.image) else { return }
            self.recipeView.recipeNameLabel.text = recipe.title
            DispatchQueue.main.async {
                self.recipeView.recipeImageView.sd_setImage(with: url)
            }
        }
    }
    
    private lazy var recipeView = RecipeDetailUIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        recipeView.customTableView.delegate = self
        recipeView.customTableView.dataSource = self
        
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
                self.recipeView.customTableView.reloadData()
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
        return 2
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section == 0 {
            let ingredients = recipe.extendedIngredients[indexPath.row]
            cell.textLabel?.text = ingredients.originalName
        }else{
            let stepsOfPreparations = recipe.analyzedInstructions[0].steps[indexPath.row]
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



