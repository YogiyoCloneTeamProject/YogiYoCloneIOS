//
//  ImageTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
  
  let detailmenuImage = UIImageView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    constrian()
  }
  
  func setUI(){
    selectionStyle = .none
    layer.masksToBounds = true
    setImage()
    
  }
  
  func setImage(){
    //detailmenuImage.layer.masksToBounds = true
    detailmenuImage.backgroundColor = .black
    detailmenuImage.contentMode = .scaleToFill
    detailmenuImage.image = UIImage(named: "TopImageView")
    detailmenuImage.layer.masksToBounds = true
    
    contentView.addSubview(detailmenuImage)
    
    
  }
  
  
  func constrian() {
    [detailmenuImage].forEach{
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
    }
    //Full
    NSLayoutConstraint.activate([
      detailmenuImage.topAnchor.constraint(equalTo: contentView.topAnchor),
      detailmenuImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      detailmenuImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
      detailmenuImage.heightAnchor.constraint(equalToConstant: 280)
    ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(){
    //셀데이터 넣을 곳
  }
}
