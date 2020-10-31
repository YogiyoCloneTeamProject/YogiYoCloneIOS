//
//  TopView.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/06.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class TopView : UIView {
  
  
  let topLabel : UILabel = {
    let topLabel = UILabel()
    topLabel.text = "전체보기 \(1)개"
    topLabel.font = FontModel.toSize.customSmallFont
    return topLabel
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = ColorPiker.customSystem
    addSubview(topLabel)
    AttributedString()
    setConstrain()
  }
  
  func AttributedString(){
    let attr = NSMutableAttributedString(string: topLabel.text!)
    attr.addAttribute(NSAttributedString.Key.foregroundColor,
                      value: ColorPiker.customMainRed, range: (topLabel.text! as NSString).range(of: "1")) // 글자 색깔
    attr.addAttribute(NSAttributedString.Key.init(kCTFontAttributeName as String),
                      value: UIFont(name: FontModel.customSemibold, size: 14) as Any, range: (topLabel.text! as NSString).range(of: "1"))// 폰트
    topLabel.attributedText = attr
  }
  
  
  func setConstrain() {
    topLabel.snp.makeConstraints {(make) in
      make.centerY.equalToSuperview()
      make.leading.equalToSuperview().inset(20)
      
      
  }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  
  }
  
  
}
