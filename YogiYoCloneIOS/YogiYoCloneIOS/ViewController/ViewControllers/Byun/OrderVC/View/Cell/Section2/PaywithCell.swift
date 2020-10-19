//
//  PaywithCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class PaywithCell : UITableViewCell {
  
  let numberImage: UIImageView = {
   let i = UIImageView()
     i.image = UIImage(systemName: "2.circle.fill")
     i.tintColor = ColorPiker.customMainRed
     return i
   }()
   
   let paywithLable : UILabel = {
     let l = UILabel()
     l.text = "결제 수단 선택"
     l.font = UIFont.boldSystemFont(ofSize: 24)
     return l
   }()
  
  let payView = Paywith()
   
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    setConstraint()
    selectionStyle = .none

  }
  
  
  func setUI(){
    [paywithLable].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    [numberImage,payView].forEach{
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
         
         paywithLable.centerYAnchor.constraint(equalTo: numberImage.centerYAnchor),
         paywithLable.leadingAnchor.constraint(equalTo: numberImage.trailingAnchor, constant: 8),
         paywithLable.widthAnchor.constraint(equalToConstant: 150),
        
         payView.topAnchor.constraint(equalTo: paywithLable.bottomAnchor, constant: 18),
         payView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
         payView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
       ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
