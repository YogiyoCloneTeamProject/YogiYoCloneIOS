//
//  OptionTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class OptionTableViewCell: UITableViewCell {
  
  
  let optionLable: UILabel = {
    let l = UILabel()
    l.font = FontModel.toSize.customFont
    l.text = "옵션"
    l.textColor = .black //ColorPiker.customDarkGray
    return l
  }()
  
  let optionsubLable: UILabel = {
     let l = UILabel()
     l.font = UIFont(name: FontModel.customLight, size: 15)
     l.text = "(추가 옵션)"
     l.textColor = ColorPiker.customMainRed
     return l
   }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    [optionLable, optionsubLable].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)

    }
    setConstrain()
  }
  
  
  func setConstrain(){
    NSLayoutConstraint.activate([
      optionLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      optionLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      optionLable.heightAnchor.constraint(equalToConstant: 30),
      
      
      optionsubLable.leadingAnchor.constraint(equalTo: optionLable.trailingAnchor, constant: 4),
      optionsubLable.bottomAnchor.constraint(equalTo: optionLable.bottomAnchor, constant: -4)
      
    ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
