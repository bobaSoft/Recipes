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
    configurateCollectionView()
      view.backgroundColor = .white
      NetworkRequestManager.shared?.request(searchWord: "Pizza", completion: { recipes in
          DispatchQueue.main.async  {
            self.recipes = recipes
            self.collectionView.reloadData()
          }
      })
      
    print("Hello world")

  }


  private func configurateCollectionView(){
    self.collectionView!.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: RecipeCollectionViewCell.reuseID)
    collectionView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    collectionView.contentInsetAdjustmentBehavior = .automatic


  }



}

//MARK: - UICollectionViewDataSource
extension SearchViewController{

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return recipes.count
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.reuseID, for: indexPath) as! RecipeCollectionViewCell

//    cell.imageDish.image = UIImage(systemName: "capsule.fill")
    let dish = recipes[indexPath.item]
    cell.recipe = dish
    return cell
  }

}

extension SearchViewController: UICollectionViewDelegateFlowLayout
{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width: CGFloat = view.bounds.width / 2 - 16
        let height: CGFloat = 300

        return CGSize(width: width, height: height)
    }



    // не робит -------- //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 1
    } // ------------ //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}






