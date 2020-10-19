//
//  paymentCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/18.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class paymentCell: UITableViewCell {
  
  let irdpartyLabel : UILabel = {
    let l = UILabel()
    l.text = " 개인정보 제3자 제공 내용 확인하였으며 결제에 동의합니다. "
    l.textAlignment = .center
    l.layer.masksToBounds = true
    l.font = FontModel.toSize.customSmallFont
    l.backgroundColor = ColorPiker.customSystem
    return l
  }()
  let uiViewLabel : UILabel = {
     let l = UILabel()
     l.backgroundColor = .white
     return l
   }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    setConstraint()
    selectionStyle = .none
  }
  
  func setUI(){
    contentView.addSubview(irdpartyLabel)
    contentView.addSubview(uiViewLabel)
    irdpartyLabel.translatesAutoresizingMaskIntoConstraints = false
    uiViewLabel.translatesAutoresizingMaskIntoConstraints = false
  }
  func setConstraint(){
    NSLayoutConstraint.activate([
      
      irdpartyLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
      irdpartyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      irdpartyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
     // irdpartyLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
    
      uiViewLabel.topAnchor.constraint(equalTo: irdpartyLabel.bottomAnchor),
      uiViewLabel.heightAnchor.constraint(equalToConstant: 90),
      uiViewLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      uiViewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
  ])
    
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
