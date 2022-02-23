//
//  FavouriteViewController .swift
//  Recipes
//
//  Created by Kirill Drozdov on 14.02.2022.
//

import UIKit
import SnapKit



class FavouriteViewController: UIViewController {

  var size = UIScreen.main.bounds
//  var dataTable:UITableView!

  var itemstringArr = ["Курица","Вода","Сахар","Соль","Кола"]


  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 100)
    self.title = "My Recipes"
    makeTable()
  }

 private lazy var dataTable: UITableView = {
    var table = UITableView()
    return table
  }()

  func makeTable(){

    dataTable=UITableView.init(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 64), style:.grouped)
    dataTable.delegate = self
    dataTable.dataSource = self
    self.view.addSubview(dataTable)
    dataTable.register(UITableViewCell.self, forCellReuseIdentifier: "identifier")
    dataTable.backgroundColor = UIColor.init(_colorLiteralRed:  251/255, green:248/255, blue: 241/255, alpha: 100)
  }
  // ---------- //
}


extension FavouriteViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("indexPath.row = \(indexPath.row)")
    print("хай зяблс")
  }
}


extension FavouriteViewController: UITableViewDataSource{

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemstringArr.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
    if cell == nil {
      cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "identifier")
    }

    cell.imageView?.image = UIImage(named: "pizza")
    cell.textLabel?.text = itemstringArr[indexPath.row]
    cell.detailTextLabel?.text = "read"
    return cell
  }


  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
}
