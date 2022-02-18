//
//  RecipeDetailUIView.swift
//  Recipes
//
//  Created by Михаил Бобров on 18.02.2022.
//

import UIKit


class RecipeDetailUIView: UIView {
    
    var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private func recipeImageViewConfiguration() {
        self.addSubview(recipeImageView)
        recipeImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        recipeImageViewConfiguration()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods for UI configuration
    

    
}
