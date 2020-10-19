//
//  CostTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class CostTableViewCell: UITableViewCell {
  
  let costLable: UILabel = {
    let l = UILabel()
    l.font = FontModel.toSize.customFont
    l.text = "가격"
    l.textColor = .black //ColorPiker.customDarkGray
    return l
  }()
  
  let costLableWon:UILabel = {
    let l = UILabel()
    l.font = FontModel.toSize.customFont
    l.text = "\("1,200")원"
    l.textColor = .black
    return l
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstrain()
  }
  
  func setUI(){
    [costLable,costLableWon].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
      $0.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
  }
  
  func setConstrain(){
    NSLayoutConstraint.activate([
      costLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      costLable.heightAnchor.constraint(equalToConstant: 50),
      costLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
      
      costLableWon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
    ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

