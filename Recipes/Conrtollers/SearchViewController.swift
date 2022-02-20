//
//  SearchViewController.swift
//  Recipes
//
//  Created by Михаил Бобров on 13.02.2022.
//

import UIKit

class SearchViewController: UICollectionViewController {

  private var recipes = [RecipesResult]()
  private var timer: Timer?

  override func viewDidLoad() {

    super.viewDidLoad()
    collectionView.backgroundColor = UIColor(red: 251/255, green: 248/255, blue: 241/255, alpha: 100)
    configurateCollectionView()
    setUpSearchBar()
    view.backgroundColor = .white
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.tabBarController?.tabBar.isHidden = false

  }

/// Настройка searchBar
  private func setUpSearchBar(){
    let searchConroller = UISearchController(searchResultsController: nil)
    searchConroller.searchBar.placeholder = "Search recipe"
    searchConroller.obscuresBackgroundDuringPresentation = false
    searchConroller.searchBar.delegate = self
    navigationItem.hidesSearchBarWhenScrolling = false
    self.navigationItem.searchController = searchConroller
  }

///  Регистрируется ячейка
  private func configurateCollectionView(){
    self.collectionView!.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: RecipeCollectionViewCell.reuseID)
    collectionView.contentInsetAdjustmentBehavior = .automatic
  }
}

//MARK: - UICollectionViewDataSource
extension SearchViewController{

/// Количество секций
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

/// Количество ячеек
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return recipes.count
  }


/// Заполнение ячейки
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.reuseID, for: indexPath) as! RecipeCollectionViewCell
    let dish = recipes[indexPath.item]
    cell.recipe = dish

    cell.imageDish.layer.masksToBounds = true
    cell.imageDish.layer.cornerRadius = 20

    return cell
  }


/// Нажатие на ячейку
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as! RecipeCollectionViewCell
    guard let id = cell.recipe.id else {return}


    let dishView = RecipeViewController()
    dishView.fetchData(id: id)
    navigationController?.pushViewController(dishView, animated: true)
  }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout
{

/// Внешние параметры ячейки, в плане размера и все такое
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width: CGFloat = view.bounds.width / 2 - 16
    let height: CGFloat = 280 // было 300
    return CGSize(width: width, height: height)
  }


  /// Настройка отступов от каждого края коллекции
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
  }
}

extension SearchViewController: UISearchBarDelegate
{

/// При смене текста в searchBar
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
      NetworkRequestManager.shared?.request(searchWord: searchText, completion: { [ self]  data in
        recipes = data
        DispatchQueue.main.async {
          collectionView.reloadData()
        }
      })
    })
  }
}




