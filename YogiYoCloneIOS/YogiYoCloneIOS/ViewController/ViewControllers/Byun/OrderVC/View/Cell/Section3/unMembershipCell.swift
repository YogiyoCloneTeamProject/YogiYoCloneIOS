//
//  unMembershipCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class unMembershipCell : UITableViewCell {
  
  let numberImage: UIImageView = {
  let i = UIImageView()
    i.image = UIImage(systemName: "3.circle.fill")
    i.tintColor = ColorPiker.customMainRed
    return i
  }()
  
  let membershipLable : UILabel = {
    let l = UILabel()
    l.text = "할인 방법 선택"
    l.font = UIFont.boldSystemFont(ofSize: 24)
    return l
  }()
  
  let unmembershipMassege : UILabel = {
    let l = UILabel()
    l.text = "현장결제 시 쿠폰/포인트/슈퍼클럽 할인을 받으실 수 없습니다"
    l.textAlignment = .center
    l.numberOfLines = 2
    l.font = UIFont(name: FontModel.customLight, size: 16)//FontModel.toSize.customMediumFont
    l.textColor = ColorPiker.customMainRed
    return l
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    setConstraint()
  }

  func setUI() {
    [numberImage,membershipLable,unmembershipMassege].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
  }
  
  func setConstraint() {
    NSLayoutConstraint.activate([
    numberImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
    numberImage.widthAnchor.constraint(equalToConstant: 30),
    numberImage.heightAnchor.constraint(equalToConstant: 30),
    numberImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

    membershipLable.centerYAnchor.constraint(equalTo: numberImage.centerYAnchor),
    membershipLable.leadingAnchor.constraint(equalTo: numberImage.trailingAnchor, constant: 8),
    membershipLable.widthAnchor.constraint(equalToConstant: 150),

    unmembershipMassege.topAnchor.constraint(equalTo: membershipLable.bottomAnchor, constant: 16),
    unmembershipMassege.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
    unmembershipMassege.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
    unmembershipMassege.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
    
    ])
  }

  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
