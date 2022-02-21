//
//  StepTableViewCell.swift
//  Recipes
//
//  Created by Михаил Бобров on 21.02.2022.
//

import UIKit

class StepTableViewCell: UITableViewCell {
    
    var ingredient: ExtendedIngredient! {
        didSet {
            ingredientLabel.text = ingredient.originalName
        }
    }
    
    static let reuseID = "StepCell"
    
    private lazy var ingredientLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI configuration methods
    
    private func setUpUI() {
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.contentView.backgroundColor = UIColor.clear
        addSubview(ingredientLabel)
        ingredientLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(5)
            make.bottom.equalTo(self.snp.bottom).inset(5)
            make.trailing.equalTo(self.snp.trailing).inset(10)
            make.leading.equalTo(self.snp.leading).inset(10)
        }
    }
    
}
