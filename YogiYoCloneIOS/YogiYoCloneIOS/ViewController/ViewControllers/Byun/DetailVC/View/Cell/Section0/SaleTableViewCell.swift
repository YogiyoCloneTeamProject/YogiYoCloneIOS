//
//  SaleTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SaleTableViewCell: UITableViewCell {
  
  let saleRogo : UILabel = {
    let rogo = UILabel()
    rogo.text = " 요기서결제시 2,000원할인 "
    rogo.font = UIFont(name: FontModel.customRegular, size: 11)
    rogo.textColor = ColorPiker.customRed
    rogo.layer.borderWidth = 0.5
    rogo.layer.borderColor = ColorPiker.customRed.cgColor //?? UIColor.red.cgColor
    return rogo
  }()
  
  
  //  let saleRogo = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    selectionStyle = .none
    contentView.addSubview(saleRogo)
    setConstrain()
    
  }
  
  
  func setConstrain(){
    saleRogo.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      saleRogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
      saleRogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      saleRogo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
