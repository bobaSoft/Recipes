//
//  RecipeDetailUIView.swift
//  Recipes
//
//  Created by Михаил Бобров on 18.02.2022.
//

import UIKit

/// Все элементы ui для детального экрана
class RecipeDetailUIView: UIView {
<<<<<<< HEAD
    
    //MARK: -  View элементы
    
    let mainScrollView: UIScrollView = {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: 1500)
        return scrollView
    }()
    
    lazy var recipeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    lazy var viewForTableView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var customTableView: UITableView =  {
        let tableView = UITableView.init(frame: CGRect.zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setUpImageView()
        setUpNameLabel()
        setUpViewForTable()
        setUpTableView()
        customTableView.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
=======

  //MARK: -  View элементы

  let mainScrollView: UIScrollView = {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenWidth, height: screenHeight))
    scrollView.contentSize = CGSize(width: screenWidth, height: 2000)
    return scrollView
  }()


  let indicator: UIActivityIndicatorView = {
    var indicator = UIActivityIndicatorView()
    indicator.startAnimating()
    indicator.color = .red
    return indicator
  }()



  lazy var recipeNameLabel: UILabel = {
    let label = UILabel()
    label.text = "Скоро буду..."

    label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
  }()

  lazy var recipeImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    //        imageView.backgroundColor = .red
    imageView.layer.cornerRadius = 15
    return imageView
  }()

  lazy var viewForTableView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 10
    return view
  }()

  lazy var customTableView: UITableView =  {
    let tableView = UITableView.init(frame: CGRect.zero, style: .insetGrouped)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.backgroundColor = .systemGray6
    return tableView
  }()


  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpIndocator()
    setUpView()
    setUpImageView()
    setUpNameLabel()
    setUpViewForTable()
    setUpTableView()
    customTableView.frame = self.bounds
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Настройка view элементов

  private func setUpIndocator(){
    recipeImageView.addSubview(indicator)
    indicator.snp.makeConstraints { make in
      make.center.equalToSuperview()
>>>>>>> Kirill-2
    }
  }

  private func setUpView(){
    self.backgroundColor = .systemGray6
    self.mainScrollView.bounces = false
    self.customTableView.bounces = false
    self.addSubview(self.mainScrollView)

    self.mainScrollView.snp.makeConstraints { (make) in
      make.top.left.right.bottom.equalTo(self.safeAreaLayoutGuide)
    }
    
<<<<<<< HEAD
    private func setUpNameLabel() {
        mainScrollView.addSubview(recipeNameLabel)
        recipeNameLabel.snp.makeConstraints { make in
            make.top.equalTo(recipeImageView.snp.bottom).offset(50)
            make.trailing.equalTo(mainScrollView.contentLayoutGuide.snp.trailing).inset(10)
            make.leading.equalTo(mainScrollView.contentLayoutGuide.snp.leading).inset(10)
            make.height.equalTo(40)
        }
=======
  }

  private func setUpNameLabel() {
    mainScrollView.addSubview(recipeNameLabel)
    recipeNameLabel.snp.makeConstraints { make in
      make.centerX.equalTo(mainScrollView)
      make.top.equalTo(recipeImageView.snp.bottom).offset(50)
      make.width.equalToSuperview().inset(20)
>>>>>>> Kirill-2
    }
  }

  private func setUpImageView() {
    mainScrollView.addSubview(recipeImageView)
    recipeImageView.snp.makeConstraints { make in
      make.top.equalTo(mainScrollView.snp.bottom).offset(5)
      make.centerX.equalTo(mainScrollView)
    }
  }

  private func setUpViewForTable() {
    mainScrollView.addSubview(viewForTableView)
    viewForTableView.snp.makeConstraints { make in
      make.top.equalTo(recipeNameLabel.snp.bottom).offset(50)
      make.centerX.equalToSuperview()
      make.height.equalTo(500)
      make.width.equalToSuperview()
    }
  }

  private func setUpTableView() {
    viewForTableView.addSubview(customTableView)
    customTableView.snp.makeConstraints { make in
      make.top.bottom.leading.trailing.equalToSuperview()
    }
  }
}
