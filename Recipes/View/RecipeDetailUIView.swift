//
//  RecipeDetailUIView.swift
//  Recipes
//
//  Created by Михаил Бобров on 18.02.2022.
//

import UIKit

/// Все элементы ui для детального экрана
class RecipeDetailUIView: UIView {


  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    tableVIew.frame = self.bounds
    tableVIew.delegate = self
    tableVIew.dataSource = self
    self.backgroundColor = .white
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: -  View элементы

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

  let view2: UIView = {
         let view = UIView()
         view.backgroundColor = .green
         return view
     }()

  let tableVIew: UITableView =  {
          let table = UITableView()
          table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  //        table.translatesAutoresizingMaskIntoConstraints = false
          return table
      }()


  //MARK: - Настройка view элементов

  private func setupView(){
    self.mainScrollView.bounces = false
    self.tableVIew.bounces = false
    mainScrollView.addSubview(view2)
    view2.addSubview(tableVIew)
    
    self.backgroundColor = .white
    self.addSubview(self.mainScrollView)
    self.mainScrollView.addSubview(self.sampleLabel)
    self.mainScrollView.addSubview(self.recipeImageView)


    self.mainScrollView.snp.makeConstraints { (make) in
      make.top.left.right.bottom.equalTo(self.safeAreaLayoutGuide)
    }

    self.recipeImageView.snp.makeConstraints { make in
      make.top.equalTo(mainScrollView.snp.bottom).offset(5)
      make.centerX.equalTo(self.mainScrollView)
    }

    self.sampleLabel.snp.makeConstraints { make in
      make.centerX.equalTo(self.mainScrollView)
      make.top.equalTo(recipeImageView.snp.bottom).offset(50)
    }

    view2.snp.makeConstraints { make in
                make.top.equalTo(sampleLabel.snp.bottom).offset(50)
                make.centerX.equalToSuperview()
                make.height.equalTo(500)
                make.width.equalToSuperview()
            }

            tableVIew.snp.makeConstraints { make in
                make.top.bottom.leading.trailing.equalToSuperview()
            }

  }
}


extension RecipeDetailUIView: UITableViewDelegate, UITableViewDataSource {


    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if section == 0 {
          return 3
      }else {
          return 15
      }
  }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "dsggsdfhsdfh"
        return cell
    }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      if section == 0 {
          return 25
      }else {
          return 100
      }
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
      if section == 0 {
          return 100
      } else {
          return 50
      }
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      if section == 0 {
      return "Я ебал ваши скролл вью"
      }else {
          return "dfl;ksdfb"
      }
  }




}
