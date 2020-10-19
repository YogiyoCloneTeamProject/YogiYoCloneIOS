//
//  MembershipView.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MembershipView : UIView{
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstrain()
  }
  
  
  func setUI(){
    [couponImage,couponLable,userCoupon,couponCodeTF,againButton].forEach{
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    AttributedString()
  }
  
  
  func AttributedString(){
    let attr = NSMutableAttributedString(string: userCoupon.text!)
    attr.addAttribute(NSAttributedString.Key.foregroundColor,
                      value: ColorPiker.customMainRed, range: (userCoupon.text! as NSString).range(of: "0장")) // 글자 색깔
    attr.addAttribute(NSAttributedString.Key.init(kCTFontAttributeName as String),
                      value: UIFont(name: FontModel.customSemibold, size: 14) as Any, range: (userCoupon.text! as NSString).range(of: "0장"))// 폰트
    userCoupon.attributedText = attr
  }
  
  let couponImage : UIImageView = {
    let l = UIImageView()
    l.image = UIImage(named: "c.png")
    return l
  }()
  
  let couponLable : UILabel = {
    let l = UILabel()
    l.text = "쿠폰"
    l.font = FontModel.toSize.customMediumFont
    return l
  }()
  
  let userCoupon: UILabel = {
    let l = UILabel()
    l.backgroundColor = .white
    l.layer.borderColor = UIColor.black.cgColor
    l.layer.borderWidth = 0.7
    l.text = " 보유 쿠폰 0장 ‣ "
    l.textAlignment = .center
    l.font = FontModel.toSize.customSmallFont
    return l
  }()
  
  let couponCodeTF : UITextField = {
    let f = UITextField()
    f.placeholder = " 쿠폰코드 입력"
    f.keyboardType = .default
    f.backgroundColor = .white
    return f
  }()
  
    let againButton : UIButton = {
    let b = UIButton()
      b.backgroundColor = ColorPiker.customMainRed
      b.setTitle("확인", for: .normal)
      b.setTitleColor(.white, for: .normal)
    return b
  }()
  
  func setConstrain(){
    NSLayoutConstraint.activate([
      couponImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      couponImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      couponImage.widthAnchor.constraint(equalToConstant: 30),
      couponImage.heightAnchor.constraint(equalToConstant: 28),
      
      couponLable.centerYAnchor.constraint(equalTo: couponImage.centerYAnchor),
      couponLable.leadingAnchor.constraint(equalTo: couponImage.trailingAnchor, constant: 8),
      
      userCoupon.centerYAnchor.constraint(equalTo: couponLable.centerYAnchor),
      userCoupon.leadingAnchor.constraint(equalTo: couponLable.trailingAnchor, constant: 8),
      userCoupon.heightAnchor.constraint(equalToConstant: 24),
      userCoupon.widthAnchor.constraint(equalToConstant: 100),
      
      couponCodeTF.topAnchor.constraint(equalTo: couponImage.bottomAnchor, constant: 12),
      couponCodeTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      couponCodeTF.heightAnchor.constraint(equalToConstant: 40),
      couponCodeTF.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
      
      againButton.topAnchor.constraint(equalTo: couponImage.bottomAnchor, constant: 12),
      againButton.leadingAnchor.constraint(equalTo: couponCodeTF.trailingAnchor, constant: 8),
      againButton.heightAnchor.constraint(equalToConstant: 40),
      againButton.widthAnchor.constraint(equalToConstant: 90),

      againButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

    ])
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
