//
//  ReviewTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
  
  
  let reviewButton : UIButton = {
    let b = UIButton()
    b.backgroundColor = ColorPiker.customGray
    b.setTitle("리뷰보기 (\(19)) ⟩", for: .normal)
    b.setTitleColor(.darkGray, for: .normal)
    b.titleLabel?.font = UIFont(name : FontModel.customSemibold, size: 17)
    return b
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    // selectionStyle = .none
    reviewButton.layer.cornerRadius = 20
    contentView.addSubview(reviewButton)
    setConstrain()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func setConstrain(){
    reviewButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      reviewButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant:  -8),
      reviewButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      reviewButton.heightAnchor.constraint(equalToConstant: 44),
      reviewButton.widthAnchor.constraint(equalToConstant: 160),
      reviewButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -18)
    ])
  }
  
}

