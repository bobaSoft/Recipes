//
//  RecipeCollectionViewCell  .swift
//  Recipes
//
//  Created by Kirill Drozdov on 14.02.2022.
//

import UIKit
import SnapKit
import SDWebImage

//MARK:  - Кастомная ячейка для коллекции, в которую выводятся резуьтаты поиска
class RecipeCollectionViewCell: UICollectionViewCell{

  static let reuseID = "recipeCell" // id!!!

  /// Заполнение ячейки
  var recipe: RecipesResult!{
    didSet{
      let photo = recipe.image
      guard let imageURL = photo, let url = URL(string: imageURL) else {return}
      imageDish.sd_setImage(with: url, completed: nil)
      nameDish.text = recipe.title
    }
  }

  // image dish
  lazy var imageDish: UIImageView = {
    let dish = UIImageView()
    dish.contentMode = .scaleToFill
    dish.layer.masksToBounds = true
    return dish
  }()

  //nameDish
  lazy var nameDish: UILabel = {
    let name = UILabel()
    name.text = "Pizza"
    name.numberOfLines = 2
    name.textAlignment = .center
    return name
  }()

  /// prepareForReuse
  override func prepareForReuse() {
    super.prepareForReuse()
    imageDish.image = nil

  }

  /// init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupImageView()
    setupLabel()
  }
  /// required init
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  /// Настройка внешнего вида Image
  private func setupImageView(){
    addSubview(imageDish)

    imageDish.snp.makeConstraints { make in
      make.centerX.equalTo(self.snp.centerX)
      make.height.equalTo(225)
      make.width.equalTo(self.snp.width)
    }
  }

  /// Настройка внешнего вида Label
  private func setupLabel(){
    addSubview(nameDish)
    nameDish.snp.makeConstraints { make in
      make.centerX.equalTo(self.snp.centerX)
      make.leading.equalTo(self.snp.leading).inset(10)
      make.trailing.equalTo(self.snp.trailing).inset(10)
      make.top.equalTo(imageDish.snp.bottom).inset(-5)
    }
  }
}
