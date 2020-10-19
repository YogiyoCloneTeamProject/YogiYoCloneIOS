//
//  CustomOrderCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class CustomOrderCell : UITableViewCell{
  

  let userCustomMasseg2: UILabel = {
      let l = UILabel()
      l.text = "  요청사항을 선택하세요."
      l.font = UIFont(name: FontModel.customRegular, size: 17)
      l.layer.borderColor = ColorPiker.customAlpha2.cgColor
      l.layer.borderWidth = 0.8
      l.textColor = .black
      return l
    }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    setConstraint()
    selectionStyle = .none

  }
  
  
  func setUI(){
    
    contentView.addSubview(userCustomMasseg2)
    userCustomMasseg2.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func setConstraint(){
    NSLayoutConstraint.activate([
      userCustomMasseg2.topAnchor.constraint(equalTo: contentView.topAnchor),
      userCustomMasseg2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      userCustomMasseg2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
     userCustomMasseg2.heightAnchor.constraint(equalToConstant: 50),
      userCustomMasseg2.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK:-configure
  func configure(title: String){
    userCustomMasseg2.text = title
  }
  
}

//MARK:-UIPickerViewDataSource
extension OderVC : UIPickerViewDataSource {
  //Component갯수
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }
  //Component row갯수
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    pikerList.count
  }
  }

//MARK:-UIPickerViewDelegate
extension OderVC : UIPickerViewDelegate{
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    pikerList[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    userString = pikerList[row]
//    pickerView.reloadAllComponents()

  //  userString.resignFirstResponder()
  }
}


