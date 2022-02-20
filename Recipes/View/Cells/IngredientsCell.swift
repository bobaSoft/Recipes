//
//  IngredientsCell.swift
//  Recipes
//
//  Created by Kirill Drozdov on 20.02.2022.
//

import Foundation
import UIKit

class IngredientsCell: UITableViewCell{

   var containLab:UILabel


   fileprivate var imgV_R:UIImageView?

   override func awakeFromNib() {
       super.awakeFromNib()
       // Initialization code
   }

   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       containLab = UILabel()
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       self.initUI()
   }

   override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)
       // Configure the view for the selected state
   }

   fileprivate func initUI(){

       self.selectionStyle = UITableViewCell.SelectionStyle.none
//       self.backgroundColor = UIColor.brown
       self.contentView.backgroundColor = UIColor.clear


       containLab.numberOfLines = 0
       containLab.backgroundColor = UIColor.clear
     containLab.font = .systemFont(ofSize: 18, weight: .medium)
       containLab.textColor = .black

       self.contentView.addSubview(containLab)
       containLab.snp.makeConstraints({ (make) in
         make.center.equalToSuperview()
         make.left.trailing.equalTo(5)
         make.top.equalToSuperview()
         make.bottom.equalToSuperview()
       })

   }
    func ConfigCellWithContain(_ contain: Step){
      containLab.text = contain.step
   }

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}
