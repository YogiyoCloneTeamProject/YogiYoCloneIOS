//
//  BuyTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

protocol buyDelegate : class {
  func plusdidTap(sender : UIButton, up: Int)
  func minusdidTap(sender : UIButton, down: Int)
}

class BuyTableViewCell: UITableViewCell {
  
  weak var delegate : buyDelegate?
  
  let buyLable: UILabel = {
    let l = UILabel()
    l.font = FontModel.toSize.customFont
    l.text = "수량"
    l.textColor = .black
    return l
  }()
  
  let minusButton : UIButton = {
    let b = UIButton()
    b.setImage(UIImage(systemName: "minus"), for: .normal)
    b.tintColor = ColorPiker.customDarkGray
    b.layer.borderWidth = 1
    b.layer.borderColor = ColorPiker.customDarkGray.cgColor
    return b
  }()
  
  let countLable : UILabel = {
    let l = UILabel()
    l.text = "1"
    l.textAlignment = .center
    l.layer.borderWidth = 1
    l.layer.borderColor = ColorPiker.customDarkGray.cgColor
    return l
  }()
  
  let plusButton : UIButton = {
    let b = UIButton()
    b.setImage(UIImage(systemName: "plus"), for: .normal)
    b.layer.borderWidth = 1
    b.layer.borderColor = ColorPiker.customDarkGray.cgColor
    b.tintColor = .black
    return b
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstrain()
    
  }
  
  func setUI(){
    [buyLable,minusButton,countLable,plusButton].forEach{
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    buttondidTab()
  }
  
  
  func buttondidTab(){
    plusButton.addTarget(self, action: #selector(plusdidTap), for: .touchUpInside)
    minusButton.addTarget(self, action: #selector(minusdidTap), for: .touchUpInside)
  }
  
  
  //MARK:- Action
  var pieceCount: Int = 1{
    didSet {
      countLable.text = "\(pieceCount)"
      if countLable.text == "1" {
        minusButton.tintColor = ColorPiker.customDarkGray
      }else {
        minusButton.tintColor = .black
      }
    }
  }
  
  //증가
  @objc func plusdidTap(sender : UIButton){
    pieceCount += 1
    delegate?.plusdidTap(sender: sender, up: pieceCount)

  }
  //감소
  @objc func minusdidTap(sender : UIButton){
    pieceCount -= 1
    if pieceCount < 1 {
      pieceCount = 1
      countLable.text = "1"
    }
    delegate?.minusdidTap(sender: sender, down: pieceCount)
  }
  
  
  struct stackSize {
    static let stack: CGFloat = 40
  }
  
  func setConstrain(){
    NSLayoutConstraint.activate([
      buyLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      buyLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      buyLable.heightAnchor.constraint(equalToConstant: 70),
      buyLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      
      //   plusButton.centerYAnchor.constraint(equalTo: buyLable.centerYAnchor),
      plusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      plusButton.widthAnchor.constraint(equalToConstant: stackSize.stack),
      plusButton.heightAnchor.constraint(equalToConstant: stackSize.stack),
      
      
      countLable.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: 1),
      countLable.widthAnchor.constraint(equalToConstant: 60),
      countLable.heightAnchor.constraint(equalToConstant: stackSize.stack),
      
      minusButton.trailingAnchor.constraint(equalTo: countLable.leadingAnchor, constant: 1),
      minusButton.widthAnchor.constraint(equalToConstant: stackSize.stack),
      minusButton.heightAnchor.constraint(equalToConstant: stackSize.stack),
      
      //
      //  costView.topAnchor.constraint(equalTo: buyLable.bottomAnchor),
      //  costView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      //   costView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      //   costView.heightAnchor.constraint(equalToConstant: 40),
      //  costView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
      
    ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


  
