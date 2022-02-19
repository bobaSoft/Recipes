//
//  CustomView.swift
//  Recipes
//
//  Created by Михаил Бобров on 19.02.2022.
//

import UIKit
import SnapKit

class CustomView: UIView {
    
    let scrollView: UIScrollView = {
        let screenWidt = UIScreen.main.bounds.width
        let screenHeiht = UIScreen.main.bounds.height
        let view = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenWidt, height: screenHeiht))
        view.contentSize = CGSize(width: screenWidt, height: 2000)
        return view
    }()
    
    let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableVIew.frame = self.bounds
        tableVIew.delegate = self
        tableVIew.dataSource = self
        setUpView()
        
        print(scrollView.bounds)
        print(scrollView.contentSize)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        self.scrollView.bounces = false
        self.tableVIew.bounces = false
        self.addSubview(scrollView)
        scrollView.addSubview(view1)
        scrollView.addSubview(view2)
        view2.addSubview(tableVIew)
        view1.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top).offset(5)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        view2.snp.makeConstraints { make in
            make.top.equalTo(view1.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(500)
            make.width.equalToSuperview()
        }

        tableVIew.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
    
    }
}


extension CustomView: UITableViewDelegate, UITableViewDataSource {
    
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
}


//extension CustomView: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView == self.scrollView {
//            tableVIew.isScrollEnabled = (self.scrollView.contentOffset.y >= 200)
//        }
//
//        if scrollView == self.tableVIew {
//            self.tableVIew.isScrollEnabled = (tableVIew.contentOffset.y > 0)
//        }
//    }
//}
