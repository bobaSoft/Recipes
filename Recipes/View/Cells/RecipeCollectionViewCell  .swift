//
//  RecipeCollectionViewCell  .swift
//  Recipes
//
//  Created by Kirill Drozdov on 14.02.2022.
//

import UIKit
import SnapKit
import SDWebImage

class RecipeCollectionViewCell: UICollectionViewCell{

  static let reuseID = "recipeCell"
  var recipe: RecipesResult!{
    didSet{
      let photo = recipe.image
      guard let imageURL = photo, let url = URL(string: imageURL) else {return}
      imageDish.sd_setImage(with: url, completed: nil)
      nameDish.text = recipe.title
    }
  }

   lazy var imageDish: UIImageView = {
    let dish = UIImageView()
//    dish.image = UIImage(named: "pizza")
    dish.contentMode = .scaleAspectFit
    dish.backgroundColor = .green
    return dish
  }()

   lazy var nameDish: UILabel = {
    let name = UILabel()
    name.text = "Pizza"
    name.numberOfLines = 0
    name.textAlignment = .center
    return name
  }()

  override func prepareForReuse() {
    super.prepareForReuse()
    imageDish.image = nil

  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupImageView()
    setupLabel()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  private func setupImageView(){
    addSubview(imageDish)

    imageDish.snp.makeConstraints { make in
      make.centerX.equalTo(self.snp.centerX)
//      make.height.equalTo(snp.height).multipliedBy(3 / 4)
      make.height.equalTo(225)
      make.width.equalTo(self.snp.width)
    }
  }

  private func setupLabel(){
    addSubview(nameDish)
    nameDish.snp.makeConstraints { make in
      make.centerX.equalTo(self.snp.centerX)
//      make.leading.trailing.equalTo(contentView.snp.trailing.)
      make.leading.equalTo(self.snp.leading).inset(10)
      make.trailing.equalTo(self.snp.trailing).inset(10)
      make.top.equalTo(imageDish.snp.bottom).inset(-5)
    }
  }


}
