//
//  RecipeDetailUIView.swift
//  Recipes
//
//  Created by Михаил Бобров on 18.02.2022.
//

import UIKit

/// Все элементы ui для детального экрана
class RecipeDetailUIView: UIView {
    
    
    //MARK: -  View элементы
    
    let mainScrollView: UIScrollView = {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: 2000)
        return scrollView
    }()
    
    lazy var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    lazy var recipeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        tableView.frame = mainScrollView.bounds
        self.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(IngredientsTableViewCell.self, forCellReuseIdentifier: "section1")
        tableView.register(PreparationStepsTableViewCell.self, forCellReuseIdentifier: "section2")

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Настройка view элементов
    
    private func setupView(){
        self.backgroundColor = .white
        self.addSubview(self.mainScrollView)
        self.mainScrollView.addSubview(self.recipeNameLabel)
        self.mainScrollView.addSubview(self.recipeImageView)
        self.mainScrollView.addSubview(tableView)
        
        self.mainScrollView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
        self.recipeImageView.snp.makeConstraints { make in
            make.top.equalTo(mainScrollView.snp.topMargin).offset(5)
            make.centerX.equalTo(self.mainScrollView)
            
        }
        
        self.recipeNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.mainScrollView)
            make.top.equalTo(recipeImageView.snp.bottom).offset(10)
        }
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(recipeNameLabel.snp.bottom).offset(10)
            make.centerX.equalTo(self.mainScrollView)
            make.leading.trailing.equalTo(self.mainScrollView).inset(16)
        }
    }
}

extension RecipeDetailUIView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let firstCell = tableView.dequeueReusableCell(withIdentifier: "section1", for: indexPath) as! IngredientsTableViewCell
        firstCell.backgroundColor = .red
        return firstCell
}
}
