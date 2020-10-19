//
//  PointView.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class PointView : UIView{
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstrain()
  }
  
  
  func setUI(){
    [pointImage,pointLable,userPoint,pointCodeTF,againButton].forEach{
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }

  
  let pointImage : UIImageView = {
    let l = UIImageView()
    l.image = UIImage(named: "p.png")
    return l
  }()
  
  let pointLable : UILabel = {
    let l = UILabel()
    l.text = "포인트"
    l.font = FontModel.toSize.customMediumFont
    return l
  }()
  
  let userPoint: UILabel = {
    let l = UILabel()
    l.textColor = ColorPiker.customMainRed
    l.text = "0원보유"
    l.font = FontModel.toSize.customSmallFont
    return l
  }()
  
  let pointCodeTF : UITextField = {
    let f = UITextField()
    f.placeholder = " 포인트 입력"
    f.keyboardType = .default
    f.backgroundColor = .white
    return f
  }()
  
    let againButton : UIButton = {
    let b = UIButton()
      b.backgroundColor = ColorPiker.customSystem
      b.setTitle("모두 사용", for: .normal)
      b.titleLabel?.font = FontModel.toSize.customMediumFont
      b.setTitleColor(ColorPiker.customDarkGray, for: .normal)
    return b
  }()
  
  func setConstrain(){
    NSLayoutConstraint.activate([
      pointImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      pointImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      pointImage.widthAnchor.constraint(equalToConstant: 30),
      pointImage.heightAnchor.constraint(equalToConstant: 28),
      
      pointLable.centerYAnchor.constraint(equalTo: pointImage.centerYAnchor),
      pointLable.leadingAnchor.constraint(equalTo: pointImage.trailingAnchor, constant: 8),
      
      userPoint.centerYAnchor.constraint(equalTo: pointLable.centerYAnchor),
      userPoint.leadingAnchor.constraint(equalTo: pointLable.trailingAnchor, constant: 8),
      userPoint.heightAnchor.constraint(equalToConstant: 24),
      userPoint.widthAnchor.constraint(equalToConstant: 100),
      
      pointCodeTF.topAnchor.constraint(equalTo: pointImage.bottomAnchor, constant: 12),
      pointCodeTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      pointCodeTF.heightAnchor.constraint(equalToConstant: 40),
      pointCodeTF.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
      
      againButton.topAnchor.constraint(equalTo: pointImage.bottomAnchor, constant: 12),
      againButton.leadingAnchor.constraint(equalTo: pointCodeTF.trailingAnchor, constant: 8),
      againButton.heightAnchor.constraint(equalToConstant: 40),
      againButton.widthAnchor.constraint(equalToConstant: 90),

      againButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

    ])
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
