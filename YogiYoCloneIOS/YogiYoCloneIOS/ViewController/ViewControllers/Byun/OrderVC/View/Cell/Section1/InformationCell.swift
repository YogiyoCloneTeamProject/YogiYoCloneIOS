//
//  InformationCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class InformationCell : UITableViewCell{
  
  let numberImage: UIImageView = {
  let i = UIImageView()
    i.image = UIImage(systemName: "1.circle.fill")
    i.tintColor = ColorPiker.customMainRed
    return i
  }()
   
  let informationLable : UILabel = {
    let l = UILabel()
    l.text = "주문자 정보"
    l.font = UIFont.boldSystemFont(ofSize: 24)
    return l
  }()
  
  let addressEdit: UILabel = {
    let l = UILabel()
    l.text = "주소변경"
    l.layer.borderColor = ColorPiker.customGray.cgColor
    l.layer.borderWidth = 1
    l.font = FontModel.toSize.customSmallFont
    l.textAlignment = .center
    return l
  }()
  

  let informationView = InformationView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    setConstraint()
    selectionStyle = .none

  //  setInformationView()
    
  }
  
//  func setInformationView(){
//
//  }
  
  func setUI(){
    
    [informationLable,addressEdit].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    //contentView.leadingAnchor
    [numberImage,informationView].forEach{
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    }
  }

  func setConstraint(){
    NSLayoutConstraint.activate([
      
      numberImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      numberImage.widthAnchor.constraint(equalToConstant: 30),
      numberImage.heightAnchor.constraint(equalToConstant: 30),
      
      informationLable.centerYAnchor.constraint(equalTo: numberImage.centerYAnchor),
      informationLable.leadingAnchor.constraint(equalTo: numberImage.trailingAnchor, constant: 8),
      informationLable.widthAnchor.constraint(equalToConstant: 150),
      
      addressEdit.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      addressEdit.heightAnchor.constraint(equalToConstant: 28),
      addressEdit.widthAnchor.constraint(equalToConstant: 64),
      addressEdit.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
      informationView.topAnchor.constraint(equalTo: numberImage.bottomAnchor, constant: 18),
      informationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      informationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18)
    ])
    
  }

  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
