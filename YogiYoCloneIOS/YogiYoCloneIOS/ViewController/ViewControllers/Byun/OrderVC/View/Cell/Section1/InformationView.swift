//
//  InformationView.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class InformationView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstrain()
  }
  
  func setUI(){
    [userAddress,userAddtessDetail,roadAddtess,addressTF,securePhoneTF,selectButton,selectLable,guideButton,requestList,grayButton1,selectImage1,selectLable1,grayButton2,selectImage2,selectLable2,selectLable3].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
  }
  
  let userAddress : UILabel = {
    let l = UILabel()
    l.text = "서울특별시 성동구 성수동2가"
    l.font = UIFont(name: FontModel.customMedium, size: 20)
    return l
  }()
  
  let userAddtessDetail: UILabel = {
    let l = UILabel()
    l.text = "289-10 제강빌딩"
    l.font = UIFont(name: FontModel.customRegular, size: 20)
    return l
  }()
  let roadAddtess: UILabel = {
    let l = UILabel()
    l.text = "[도로명] 289-10 제강빌딩"
    l.font = FontModel.toSize.customSmallFont
    l.textColor = ColorPiker.customDarkGray
    return l
  }()
  
  let addressTF: UITextField = {
    let f = UITextField()
    f.placeholder = " 상세주소를 입력하세요(건물명, 동/호수 입력)"
    f.keyboardType = .default
    f.layer.borderColor = UIColor.darkGray.cgColor
    f.layer.borderWidth = 0.2
    f.layer.masksToBounds = true
    return f
  }()
  let securePhoneTF: UITextField = {
    let f = UITextField()
    f.text = "01034090000"
    f.placeholder = "휴대전화번호를 입력하세요"
    f.keyboardType = .default
    f.layer.borderColor = UIColor.darkGray.cgColor
    f.layer.borderWidth = 0.2
    f.layer.masksToBounds = true
    return f
  }()
  
  let selectButton : UIButton = {
    let b = UIButton()
    b.tintColor = ColorPiker.customRed
    b.setImage(UIImage(systemName: "checkmark"), for: .normal)
    b.layer.borderWidth = 0.8
    b.layer.borderColor = ColorPiker.customRed.cgColor
    return b
  }()
  
  let selectLable: UILabel = {
    let l = UILabel()
    l.text = "안심번호 사용"
    l.font = FontModel.toSize.customSmallFont
    l.textColor = .black
    return l
  }()
  
  let guideButton : UIButton = {
    let b = UIButton()
    b.tintColor = ColorPiker.customAlpha2
    b.setImage(UIImage(systemName: "questionmark.circle.fill"), for: .normal)
    return b
  }()
  
  let requestList : UILabel = {
    let l = UILabel()
    l.text = "주문 요청사항"
    l.font = FontModel.toSize.customFont
    l.textColor = .black
    return l
  }()
  
  let grayButton1: UIButton = {
    let b = UIButton()
    b.backgroundColor = ColorPiker.customSystem
    //   b.tintColor = ColorPiker.customAlpha2
    //   b.setImage(UIImage(systemName: "questionmark.circle.fill"), for: .normal)
    return b
  }()
  
  let selectImage1 : UIImageView = {
    let i = UIImageView()
    i.backgroundColor = .white
    i.tintColor = ColorPiker.customRed
    // i.setImage(UIImage(systemName: "checkmark"), for: .normal)
    i.layer.borderWidth = 0.8
    i.layer.borderColor = ColorPiker.customDarkGray.cgColor
    return i
  }()
  
  let selectLable1: UILabel = {
    let l = UILabel()
    l.text = "[안전배달] 문 앞에 놓고, 전화주세요!"
    l.font = FontModel.toSize.customMediumFont
    l.textColor = .black
    return l
  }()
  
  let grayButton2: UIButton = {
    let b = UIButton()
    b.backgroundColor = ColorPiker.customSystem
    //   b.tintColor = ColorPiker.customAlpha2
    //   b.setImage(UIImage(systemName: "questionmark.circle.fill"), for: .normal)
    return b
  }()
  
  let selectImage2 : UIImageView = {
    let i = UIImageView()
    i.backgroundColor = .white
    i.tintColor = ColorPiker.customRed
    // i.setImage(UIImage(systemName: "checkmark"), for: .normal)
    i.layer.borderWidth = 0.8
    i.layer.borderColor = ColorPiker.customDarkGray.cgColor
    return i
  }()
  
  let selectLable2: UILabel = {
    let l = UILabel()
    l.text = "일회용 수저, 젓가락은 안 쓸게요!"
    l.font = FontModel.toSize.customMediumFont
    l.textColor = .black
    return l
  }()
  
  let selectLable3: UILabel = {
    let l = UILabel()
    l.text = "꼭 필요하지 않다면 체크해 주세요. 일회용품 줄이기 어렵지 않아요!"
    l.font = FontModel.toSize.customSmallFont
    l.numberOfLines = 2
    l.textColor = ColorPiker.customAlpha2
    return l
  }()
  
  
  func setConstrain(){
    [userAddress,userAddtessDetail,roadAddtess,addressTF,securePhoneTF,requestList,grayButton1,grayButton2].forEach{
      $0.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      userAddress.topAnchor.constraint(equalTo: topAnchor),
      userAddtessDetail.topAnchor.constraint(equalTo: userAddress.bottomAnchor),
      roadAddtess.topAnchor.constraint(equalTo: userAddtessDetail.bottomAnchor),
      
      addressTF.topAnchor.constraint(equalTo: roadAddtess.bottomAnchor, constant: 12),
      addressTF.heightAnchor.constraint(equalToConstant: 47),
      
      securePhoneTF.topAnchor.constraint(equalTo: addressTF.bottomAnchor, constant: 12),
      securePhoneTF.heightAnchor.constraint(equalToConstant: 47),
      
      selectButton.topAnchor.constraint(equalTo: securePhoneTF.bottomAnchor, constant: 10),
      selectButton.leadingAnchor.constraint(equalTo: leadingAnchor),
      selectButton.widthAnchor.constraint(equalToConstant: 24),
      selectButton.heightAnchor.constraint(equalToConstant: 24),
      
      selectLable.centerYAnchor.constraint(equalTo: selectButton.centerYAnchor),
      selectLable.leadingAnchor.constraint(equalTo: selectButton.trailingAnchor, constant: 8),
      
      guideButton.centerYAnchor.constraint(equalTo: selectLable.centerYAnchor),
      guideButton.leadingAnchor.constraint(equalTo: selectLable.trailingAnchor, constant: 4),
      guideButton.widthAnchor.constraint(equalToConstant: 17),
      guideButton.heightAnchor.constraint(equalToConstant: 17),
      
      requestList.topAnchor.constraint(equalTo: selectButton.bottomAnchor, constant: 20),
      
      grayButton1.topAnchor.constraint(equalTo: requestList.bottomAnchor, constant: 12),
      grayButton1.heightAnchor.constraint(equalToConstant: 44),
      
      selectImage1.centerYAnchor.constraint(equalTo: grayButton1.centerYAnchor),
      selectImage1.leadingAnchor.constraint(equalTo: grayButton1.leadingAnchor, constant: 16),
      selectImage1.widthAnchor.constraint(equalToConstant: 24),
      selectImage1.heightAnchor.constraint(equalToConstant: 24),
      
      selectLable1.centerYAnchor.constraint(equalTo: selectImage1.centerYAnchor),
      selectLable1.leadingAnchor.constraint(equalTo: selectImage1.trailingAnchor, constant: 8),
      
      
      grayButton2.topAnchor.constraint(equalTo: grayButton1.bottomAnchor, constant: 12),
      grayButton2.heightAnchor.constraint(equalToConstant: 90),
      
      
      selectImage2.topAnchor.constraint(equalTo: grayButton2.topAnchor, constant: 8),
      selectImage2.leadingAnchor.constraint(equalTo: grayButton2.leadingAnchor, constant: 16),
      selectImage2.widthAnchor.constraint(equalToConstant: 24),
      selectImage2.heightAnchor.constraint(equalToConstant: 24),
      
      selectLable2.centerYAnchor.constraint(equalTo: selectImage2.centerYAnchor),
      selectLable2.leadingAnchor.constraint(equalTo: selectImage2.trailingAnchor, constant: 12),
      
      selectLable3.topAnchor.constraint(equalTo: selectLable2.bottomAnchor, constant: 4),
      selectLable3.leadingAnchor.constraint(equalTo: selectLable2.leadingAnchor),
      selectLable3.trailingAnchor.constraint(equalTo: grayButton2.trailingAnchor, constant: -16),
      selectLable3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
    ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
