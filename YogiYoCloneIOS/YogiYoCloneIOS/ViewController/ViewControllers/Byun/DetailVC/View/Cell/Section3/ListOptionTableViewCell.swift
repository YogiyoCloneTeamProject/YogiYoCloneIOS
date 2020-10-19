//
//  ListOptionTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

protocol ListOptionDelagate : class {
  func checkdidTap(_ cell: UITableViewCell)
}

class ListOptionTableViewCell: UITableViewCell {
  
  var checkOn : Bool = false {
    didSet {
      selectButton.tintColor = checkOn ? ColorPiker.customRed : .clear
      selectButton.layer.borderColor = checkOn ? ColorPiker.customDarkGray.cgColor : ColorPiker.customDarkGray.cgColor
    }
  }
  var delegate : ListOptionDelagate?
  
  let selectButton : UIButton = {
    let b = UIButton()
    b.setImage(UIImage(systemName: "circle.fill"), for: .normal)
    b.tintColor = .clear
    b.layer.borderWidth = 0.8
    b.layer.borderColor = ColorPiker.customDarkGray.cgColor
    b.tag = 1
    // b.layer.borderColor = ColorPiker.customRed.cgColor
    return b
  }()
  
  let selectLable : UILabel = {
    let l = UILabel()
    l.font = UIFont(name: "PingFangTC-Regular", size: 18)//FontModel.toSize.customFont
    l.text = " 커리양념 변경"
    l.textColor = .black //ColorPiker.customDarkGray
    return l
  }()
  
  let costLabel : UILabel = {
    let l = UILabel()
    l.font = UIFont(name: "PingFangTC-Regular", size: 18)//FontModel.toSize.customFont
    l.text = " \("＋3000")원"
    l.textColor = .black //ColorPiker.customDarkGray
    l.textAlignment = .right
    return l
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setConstrain()
    selectButton.layer.cornerRadius = frame.width/20.5
    buttondidTab()
  }
  
  //  //MARK:- Action
  func buttondidTab(){
    selectButton.addTarget(self, action: #selector(checkdidTap), for: .touchUpInside)
  }
  
  @objc func checkdidTap(_ sender: UIButton) {
    self.delegate?.checkdidTap(self)
 }

  
  func setConstrain(){
    [selectButton,selectLable,costLabel].forEach{
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    NSLayoutConstraint.activate([
      selectButton.topAnchor.constraint(equalTo: contentView.topAnchor),
      selectButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      selectButton.widthAnchor.constraint(equalToConstant: 30),
      selectButton.heightAnchor.constraint(equalToConstant: 30),
      selectButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
      
      selectLable.centerYAnchor.constraint(equalTo: selectButton.centerYAnchor),
      selectLable.leadingAnchor.constraint(equalTo: selectButton.trailingAnchor, constant: 8),
      
      costLabel.centerYAnchor.constraint(equalTo: selectButton.centerYAnchor),
      costLabel.widthAnchor.constraint(equalToConstant: 100),
      costLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
      costLabel.leadingAnchor.constraint(equalTo: selectLable.trailingAnchor,constant: 2)
    ])
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

