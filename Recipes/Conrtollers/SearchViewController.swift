//
//  SearchViewController.swift
//  Recipes
//
//  Created by Михаил Бобров on 13.02.2022.
//

import UIKit

class SearchViewController: UICollectionViewController {

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
    
    func generateGridLayout() -> UICollectionViewLayout {
        let padding: CGFloat = 20
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalHeight(1)))
        let groupe = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/4)), subitem: item, count: 2)
        groupe.interItemSpacing = .fixed(padding)
        groupe.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: 0, trailing: padding)
        
        let section = NSCollectionLayoutSection(group: groupe)
        section.interGroupSpacing = padding
        section.contentInsets = NSDirectionalEdgeInsets(top: padding, leading: 0, bottom: padding, trailing: 0)
        
        return UICollectionViewCompositionalLayout(section: section)
    }

}

