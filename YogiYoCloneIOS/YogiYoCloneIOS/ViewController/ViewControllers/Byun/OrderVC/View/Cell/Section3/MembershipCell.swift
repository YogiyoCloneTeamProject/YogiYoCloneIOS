//
//  MembershipCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MembershipCell: UITableViewCell {
  
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
  
  let membershipView = MembershipView()
  let userpointView = PointView()


  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    setConstraint()
    memberView()
    pointView()
    selectionStyle = .none

  }
  
  func memberView(){
    membershipView.backgroundColor = ColorPiker.customGray
    membershipView.layer.borderWidth = 0.8
    membershipView.layer.borderColor = ColorPiker.customDarkGray.cgColor
  }
  
  func pointView(){
    userpointView.backgroundColor = ColorPiker.customGray
    userpointView.layer.borderWidth = 0.8
    userpointView.layer.borderColor = ColorPiker.customDarkGray.cgColor
  }
  
  func setUI(){
    [membershipLable].forEach{
        $0.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview($0)
      }
      [numberImage,membershipView,userpointView].forEach{
           contentView.addSubview($0)
           $0.translatesAutoresizingMaskIntoConstraints = false
           $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
         }
  }
  
  func setConstraint(){
    NSLayoutConstraint.activate([
            
            numberImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            numberImage.widthAnchor.constraint(equalToConstant: 30),
            numberImage.heightAnchor.constraint(equalToConstant: 30),
            
            membershipLable.centerYAnchor.constraint(equalTo: numberImage.centerYAnchor),
            membershipLable.leadingAnchor.constraint(equalTo: numberImage.trailingAnchor, constant: 8),
            membershipLable.widthAnchor.constraint(equalToConstant: 150),

            membershipView.topAnchor.constraint(equalTo: membershipLable.bottomAnchor, constant: 20),
            membershipView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            userpointView.topAnchor.constraint(equalTo: membershipView.bottomAnchor, constant: 8),
            userpointView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userpointView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
      
      
          ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
