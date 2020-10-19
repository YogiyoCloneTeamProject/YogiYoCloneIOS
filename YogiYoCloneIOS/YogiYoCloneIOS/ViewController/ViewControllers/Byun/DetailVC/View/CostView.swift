//
//  CostView.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class CostView: UIView {
  
  let addButton : UIButton = {
    let b = UIButton()
    b.backgroundColor = .darkGray
    b.setTitle("주문표에 추가", for: .normal)
    b.setTitleColor(.white, for: .normal)
    b.titleLabel?.font = FontModel.toSize.customFont
    return b
  }()
  
  let orderButton : UIButton = {
    let b = UIButton()
    b.backgroundColor = ColorPiker.customMainRed
    b.setTitle("주문하기", for: .normal)
    b.setTitleColor(.white, for: .normal)
    b.titleLabel?.font = FontModel.toSize.customFont
    b.addTarget(self, action: #selector(orderDidTap(_:)), for: .touchUpInside)
    return b
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraint()
  }
  
  @objc func orderDidTap(_ sender: UIButton){
   // navigationController?.pushViewController(animated: true)

  }
  
  func setUI(){
    [addButton,orderButton].forEach{
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.topAnchor.constraint(equalTo: topAnchor).isActive = true
      $0.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
      $0.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
  }
  
  func setConstraint(){
    
    NSLayoutConstraint.activate([
      addButton.leadingAnchor.constraint(equalTo: leadingAnchor),
      orderButton.leadingAnchor.constraint(equalTo: addButton.trailingAnchor),
    ])
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
