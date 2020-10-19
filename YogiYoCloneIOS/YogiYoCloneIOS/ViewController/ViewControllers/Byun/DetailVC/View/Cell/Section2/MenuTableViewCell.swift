//
//  MenuTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
  
  let menuLable: UILabel = {
    let l = UILabel()
    l.font = FontModel.toSize.customFont
    l.text = "추가 / 변경 선택"
    l.textColor = .black //ColorPiker.customDarkGray
    return l
  }()
  let menusubLable: UILabel = {
    let l = UILabel()
    l.font = UIFont(name: FontModel.customLight, size: 15)
    l.text = "(추가선택 가능)"
    l.textColor = .black
    return l
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    [menusubLable,menuLable].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false

    }
    setConstrain()
  }
  func setConstrain(){
        NSLayoutConstraint.activate([
      menuLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      menuLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      menuLable.heightAnchor.constraint(equalToConstant: 30),
      
      menusubLable.leadingAnchor.constraint(equalTo: menuLable.trailingAnchor, constant: 4),
      menusubLable.bottomAnchor.constraint(equalTo: menuLable.bottomAnchor, constant: -4)
    ])
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
