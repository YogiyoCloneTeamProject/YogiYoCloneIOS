//
//  LoginCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class loginCell: UITableViewCell {
  
  let loginLable : UILabel = {
    let l = UILabel()
    l.text = "앗, 비회원으로 주문하실 건가요?"
    l.font = FontModel.toSize.customFont
    l.textAlignment = .center
    return l
  }()
  
  let loginsubLable: UILabel = {
    let l = UILabel()
    l.text = "매달 제공되는 회원 혜택 쿠폰을 놓치지 마세요!"
    l.numberOfLines = 1
    l.font = FontModel.toSize.customSmallFont
    l.textColor = ColorPiker.customDarkGray
    l.textAlignment = .center
    return l
  }()
  
  let loginBttonlable: UILabel = {
    let l = UILabel()
    l.text = "로그인"
    l.font = FontModel.toSize.customFont
    l.backgroundColor = ColorPiker.customMainRed
    l.textColor = .white
    l.textAlignment = .center
    return l
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    setUI()
    setConstrain()
    selectionStyle = .none
    
  }
  func setUI(){
    [loginLable,loginsubLable,loginBttonlable].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
      $0.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

    }
  }
  
  
  func setConstrain(){
    NSLayoutConstraint.activate([
      loginLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
      loginLable.widthAnchor.constraint(equalToConstant: contentView.frame.width - 60),
      
      loginsubLable.topAnchor.constraint(equalTo: loginLable.bottomAnchor),
      loginsubLable.widthAnchor.constraint(equalToConstant: contentView.frame.width - 60),
      
      loginBttonlable.topAnchor.constraint(equalTo: loginsubLable.bottomAnchor, constant: 20),
      loginBttonlable.widthAnchor.constraint(equalToConstant: contentView.frame.width - 140),
      loginBttonlable.heightAnchor.constraint(equalToConstant: 40),
      loginBttonlable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
    ])
    
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
