//
//  BackView.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import KakaoSDKCommon

class ShareView : UIView {
  
  let sharelable : UILabel = {
    let l = UILabel()
    l.text = "공유하기"
    l.textColor = .black
    l.font = FontModel.toSize.customFont
    return l
  }()
  
  let kakaoButton: UIButton = {
    let b = UIButton()
    b.setImage(UIImage(named: "kakaoshare"), for: .normal)
    b.contentMode = .scaleAspectFit
    b.adjustsImageWhenHighlighted = false
    return b
  }()
  
  let cancellable : UILabel = {
    let l  = UILabel()
    l.backgroundColor = ColorPiker.customSystem
    l.text = "닫기"
    l.textColor = .black
    l.textAlignment = .center
    return l
  }()
  
  let clipImage : UIImageView = {
    let i = UIImageView()
    i.backgroundColor = .clear
    i.image = UIImage(named: "urlshare")
    i.contentMode = .scaleAspectFit
    return i
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    setUI()
    constrain()
  }
  
  
  func setUI(){
    kakaoButton.addTarget(self, action: #selector(kakaodidTap(_:)), for: .touchUpInside)
    [sharelable,kakaoButton,cancellable,clipImage].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
  }
  
  
  func constrain(){
    NSLayoutConstraint.activate([
      sharelable.centerXAnchor.constraint(equalTo: centerXAnchor),
      sharelable.topAnchor.constraint(equalTo: topAnchor, constant: 30),
      
      kakaoButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      kakaoButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -60),
      kakaoButton.widthAnchor.constraint(equalToConstant: 120),
      kakaoButton.heightAnchor.constraint(equalToConstant: 127),
      
      cancellable.leadingAnchor.constraint(equalTo: leadingAnchor),
      cancellable.heightAnchor.constraint(equalToConstant: 44),
      cancellable.widthAnchor.constraint(equalTo: widthAnchor),
      cancellable.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      clipImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 67),
      clipImage.widthAnchor.constraint(equalToConstant: 120),
      clipImage.heightAnchor.constraint(equalToConstant: 120),
      clipImage.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
  
  //MARK: -kakaoScheme(url)
  @objc func kakaodidTap(_ sender : UIButton){
    print("ff")
    let kakaoScheme = "kakao4885bdd8a886942a7d87a2767de2b999://kakaolink"
    if let url = URL(string: kakaoScheme) {
      print("카카오ing")
      if UIApplication.shared.canOpenURL(url){
        if #available(iOS 10.0, *){
          UIApplication.shared.open(url)
          print(kakaoScheme)
        }else {
          print("not found")
       
        }
      }
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}



