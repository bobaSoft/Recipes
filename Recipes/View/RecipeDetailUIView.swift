//
//  RecipeDetailUIView.swift
//  Recipes
//
//  Created by Михаил Бобров on 18.02.2022.
//

import UIKit


class RecipeDetailUIView: UIView {

  let mainScrollView: UIScrollView = {
      let screenWidth = UIScreen.main.bounds.width
      let screenHeight = UIScreen.main.bounds.height
      let scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenWidth, height: screenHeight))
      scrollView.contentSize = CGSize(width: screenWidth, height: 2000)
      return scrollView
  }()

  let sampleLabel: UILabel = {
      let label = UILabel()
      label.text = "Test"
      label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
      label.textAlignment = .center
      return label
  }()
    var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    



  private func setupView(){
      self.backgroundColor = .white

      self.addSubview(self.mainScrollView)
      self.mainScrollView.addSubview(self.sampleLabel)
      self.mainScrollView.addSubview(self.recipeImageView)


      self.mainScrollView.snp.makeConstraints { (make) in
          make.top.left.right.bottom.equalTo(self.safeAreaLayoutGuide)
      }

      self.recipeImageView.snp.makeConstraints { make in
        make.top.equalTo(mainScrollView.snp_topMargin).offset(5)
        make.centerX.equalTo(self.mainScrollView)
        make.height.width.equalTo(250)
    }

    self.sampleLabel.snp.makeConstraints { make in
      make.centerX.equalTo(self.mainScrollView)
      make.centerY.equalTo(recipeImageView.snp_bottomMargin).offset(50)
    }

  }
    override init(frame: CGRect) {
        super.init(frame: frame)
      setupView()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods for UI configuration
    

    
}
