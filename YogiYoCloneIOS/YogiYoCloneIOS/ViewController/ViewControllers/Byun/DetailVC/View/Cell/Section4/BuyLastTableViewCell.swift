//
//  BuyLastTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class BuyLastTableViewCell: UITableViewCell {
    
      let buyLable: UILabel = {
        let l = UILabel()
        l.font = FontModel.toSize.customFont
        l.text = "총 주문금액"
        l.textColor = .black //ColorPiker.customDarkGray
        return l
      }()
      
      let costLable: UILabel = {
        let l = UILabel()
        l.font = FontModel.toSize.customFont
        l.font = UIFont(name: FontModel.customSemibold, size: 26)
        l.text = "\("22,400")원"
        l.textColor = ColorPiker.customMainRed
        return l
      }()
      
      let mincostLabel: UILabel = {
        let l = UILabel()
          l.font = FontModel.toSize.customSmallFont
          l.text = "(최소 주문금액\("15,000")원)"
          l.textColor = ColorPiker.customDarkGray
          return l
      }()
  
      
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
      setUI()
      setConstrain()
      }
  
//  func totalDidset(data: OrderData){
//    var checkOn : Bool = false {
//      didSet {
//        costLable.text = "\(data.price)"
//      }
//    }
//  }
      
      
      func setUI(){
        backgroundColor = ColorPiker.customSystem
        [buyLable,costLable,mincostLabel].forEach{
          $0.translatesAutoresizingMaskIntoConstraints = false
          contentView.addSubview($0)
        }
      }
      
      func setConstrain(){
      
      NSLayoutConstraint.activate([
        buyLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        buyLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        
       costLable.centerYAnchor.constraint(equalTo: buyLable.centerYAnchor),
       costLable.leadingAnchor.constraint(equalTo: buyLable.trailingAnchor, constant: 8),
       costLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
    //
    //
        mincostLabel.topAnchor.constraint(equalTo: costLable.bottomAnchor, constant: 8),
        mincostLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        mincostLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
      }
      
      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
    }
