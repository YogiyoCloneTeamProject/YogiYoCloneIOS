//
//  DetailTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
  
  let detailmenuRemark = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    constrian()
  }
  
  
  func setUI(){
    selectionStyle = .none
    setLable()
  }
  
  
  func setLable(){
    
    detailmenuRemark.text = "양념치킨? 간장치킨? 뭐먹을지 고민 될 땐 둘 다 ~ 짭쪼름한 스키니 프라이즈와 함꼐 즐기는 가성비 끝판왕! *메뉴구성: 순살 새우치킨(양념/간장) + 감자튀김"
    detailmenuRemark.textColor = ColorPiker.customDarkGray
    detailmenuRemark.font = FontModel.toSize.customSmallFont
    detailmenuRemark.numberOfLines = 0
    detailmenuRemark.textAlignment = .center
    contentView.addSubview(detailmenuRemark)
  }
  
  
  func constrian() {
    detailmenuRemark.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      detailmenuRemark.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
      detailmenuRemark.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      detailmenuRemark.widthAnchor.constraint(equalToConstant: contentView.frame.width - 20),
      detailmenuRemark.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
    ])
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func configure(){
  }
  
}
