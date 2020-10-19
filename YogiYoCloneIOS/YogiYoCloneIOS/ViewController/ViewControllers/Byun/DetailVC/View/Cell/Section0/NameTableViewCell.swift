//
//  NameTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
  
  let detailmenuName = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    
    setLable()
    setConstrain()
    
  }
  
  func setLable(){
    detailmenuName.text = "순살 새우치킨 콤보(반반)우이우이"
    detailmenuName.font = UIFont(name: FontModel.customLight, size: 28)
    detailmenuName.textAlignment = .center
    detailmenuName.numberOfLines = 2
    contentView.addSubview(detailmenuName)
  }
  
  func setConstrain(){
    detailmenuName.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      detailmenuName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
      detailmenuName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      detailmenuName.widthAnchor.constraint(equalToConstant: contentView.frame.width - 20),
      detailmenuName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
