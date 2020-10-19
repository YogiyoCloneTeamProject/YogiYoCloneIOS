//
//  PaywithView.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class Paywith : UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setConstrain()
  }
  
  func setUI(){
    [selectButton,yogiseoPay].forEach{
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    AttributedString()
  }
  
  func AttributedString(){
    let attr = NSMutableAttributedString(string: yogiseoPay.text!)
    attr.addAttribute(NSAttributedString.Key.foregroundColor,
                      value: ColorPiker.customDarkGray, range: (yogiseoPay.text! as NSString).range(of: "앱에서 미리 결제")) // 글자 색깔
    attr.addAttribute(NSAttributedString.Key.init(kCTFontAttributeName as String),
                      value: FontModel.toSize.customSmallFont as Any, range: (yogiseoPay.text! as NSString).range(of: "앱에서 미리 결제"))// 폰트
    yogiseoPay.attributedText = attr
  }
  
  let selectButton : UIButton = {
    let b = UIButton()
    b.setImage(UIImage(systemName: "circle.fill"), for: .normal)
    b.tintColor = ColorPiker.customRed
    b.layer.borderWidth = 0.8
    b.layer.borderColor = ColorPiker.customDarkGray.cgColor
    b.layer.cornerRadius = 12
    return b
  }()
  
  let yogiseoPay: UILabel = {
    let l = UILabel()
    l.text = "요기서 결제 앱에서 미리 결제"
    l.font = FontModel.toSize.customFont
    l.textAlignment = .center
    return l
  }()
  
  
  func setConstrain(){
    NSLayoutConstraint.activate([
      selectButton.topAnchor.constraint(equalTo: topAnchor,constant: 12),
      selectButton.leadingAnchor.constraint(equalTo: leadingAnchor),
      selectButton.widthAnchor.constraint(equalToConstant: 24),
      selectButton.heightAnchor.constraint(equalToConstant: 24),
      
      yogiseoPay.centerYAnchor.constraint(equalTo: selectButton.centerYAnchor),
      yogiseoPay.leadingAnchor.constraint(equalTo: selectButton.trailingAnchor, constant: 8),
      
      yogiseoPay.bottomAnchor.constraint(equalTo: bottomAnchor)
      
    ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
