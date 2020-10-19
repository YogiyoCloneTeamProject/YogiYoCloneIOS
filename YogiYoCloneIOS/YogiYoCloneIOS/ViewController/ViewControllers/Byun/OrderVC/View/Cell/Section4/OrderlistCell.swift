//
//  OrderlistCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class OrderListCell : UITableViewCell {

  var orderData : [OrderData]?
    
  let listTableView :UITableView = {
    let t = UITableView()
    t.backgroundColor = .white
    t.rowHeight = UITableView.automaticDimension
    t.separatorStyle = .singleLine
    return t
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraint()
    selectionStyle = .none

  }
  
  //고정금액
  struct Cost {
    static let deliveryPrice = 2000
    static let deliverySale = 1000
  }
  
  let orderlable : UILabel = {
     let l = UILabel()
     l.text = "배달 주문 내역"
     l.font = UIFont(name: FontModel.customMedium, size: 24)
     l.textAlignment = .center
     return l
   }()
  
  let deliveryPriceLable : UILabel = {
    let l = UILabel()
    l.text = "배달 요금"
    l.font = FontModel.toSize.customLargeFont
    l.textAlignment = .center
    return l
  }()
  let deliveryPriceWon : UILabel = {
    let l = UILabel()
    l.text = "\(Cost.deliveryPrice)원"
    l.font = FontModel.toSize.customLargeFont
    l.textAlignment = .center
    return l
  }()
  
  let deliverySalePriceLable : UILabel = {
    let l = UILabel()
    l.text = " ・ 배달 할인"
    l.font = FontModel.toSize.customLargeFont
    l.textAlignment = .center
    return l
  }()
  let deliverySalePriceWon : UILabel = {
    let l = UILabel()
    l.text = "-\(Cost.deliverySale)원"
    l.textColor = .orange
    l.font = FontModel.toSize.customLargeFont
    l.textAlignment = .center
    return l
  }()
  let totalOrderPrice : UILabel = {
    let l = UILabel()
    l.text = "결제 금액"
    l.textColor = ColorPiker.customMainRed
    l.font = FontModel.toSize.customLargeFont
    l.textAlignment = .center
    return l
  }()
  
  let totalOrderPriceWon : UILabel = {
     let l = UILabel()
    //l.text = "0"
    l.textColor = ColorPiker.customMainRed
    l.font = UIFont(name: FontModel.customSemibold, size: 24)
    l.textAlignment = .center
     return l
   }()
  
  let salePriceLableMessag : UILabel = {
     let l = UILabel()
    l.layer.borderColor = ColorPiker.customAlpha2.cgColor
    l.layer.borderWidth = 0.8
    l.text = "1,000원 할인 혜택을 받으셨습니다."
    l.textColor = .orange
     l.font = FontModel.toSize.customLargeFont
     l.textAlignment = .center
     return l
   }()
   
  let uiLable1 : UILabel = {
    let l = UILabel()
    l.backgroundColor = ColorPiker.customAlpha2
    l.textAlignment = .center
    return l
  }()
  let uiLable2 : UILabel = {
    let l = UILabel()
    l.backgroundColor = ColorPiker.customAlpha2
    l.textAlignment = .center
    return l
  }()
  

  
  func setUI(){
    
    listTableView.dataSource = self
  //  listTableView.delegate = self
    listTableView.register(miniListCell.self, forCellReuseIdentifier: "miniListCell")
    
    
    [orderlable,listTableView,deliveryPriceLable,deliveryPriceWon,deliverySalePriceLable,deliverySalePriceWon,uiLable1,totalOrderPrice,totalOrderPriceWon,uiLable2,salePriceLableMessag].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    //레이블
    [deliveryPriceLable,deliverySalePriceLable,totalOrderPrice,salePriceLableMessag,uiLable1,uiLable2].forEach {
      $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    }
    //원
  [deliveryPriceWon,deliverySalePriceWon,totalOrderPriceWon,salePriceLableMessag,uiLable1,uiLable2].forEach {
        $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
      }
    
  }

  func setConstraint(){
    NSLayoutConstraint.activate([
      
      orderlable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      orderlable.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
     
      listTableView.topAnchor.constraint(equalTo: orderlable.bottomAnchor, constant: 20),
      listTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      listTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      listTableView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
     // listTableView.heightAnchor.constraint(equalTo: listTableView.heightAnchor),
      
      deliveryPriceLable.topAnchor.constraint(equalTo: listTableView.bottomAnchor, constant: 12),
      deliveryPriceWon.topAnchor.constraint(equalTo: listTableView.bottomAnchor, constant: 12),
    
      
      uiLable1.topAnchor.constraint(equalTo: deliveryPriceLable.bottomAnchor, constant: 12),
      uiLable1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      uiLable1.heightAnchor.constraint(equalToConstant: 0.8),
      
      deliverySalePriceLable.topAnchor.constraint(equalTo: uiLable1.bottomAnchor, constant: 12),
      deliverySalePriceWon.topAnchor.constraint(equalTo: uiLable1.bottomAnchor, constant: 12),
      
      uiLable2.topAnchor.constraint(equalTo: deliverySalePriceWon.bottomAnchor, constant: 12),
      uiLable2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      uiLable2.heightAnchor.constraint(equalToConstant: 0.8),
      
      totalOrderPrice.topAnchor.constraint(equalTo: uiLable2.bottomAnchor, constant: 12),
      totalOrderPriceWon.centerYAnchor.constraint(equalTo: totalOrderPrice.centerYAnchor),

      salePriceLableMessag.topAnchor.constraint(equalTo: totalOrderPriceWon.bottomAnchor, constant: 12),
      salePriceLableMessag.heightAnchor.constraint(equalToConstant: 50),
      salePriceLableMessag.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


extension OrderListCell : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let count = orderData?.count {
      return count
    }else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let miniListCell = tableView.dequeueReusableCell(withIdentifier: "miniListCell", for: indexPath) as! miniListCell
   miniListCell.miniMenuLable.text = orderData?[indexPath.row].name
   //miniListCell.miniPriseLable.text = String((orderData?[indexPath.row].price)!)
    
    var addPrice = orderData![indexPath.row].price
    var nameArr : [String] = []
    miniListCell.miniPriseLable.text! = String( orderData?[indexPath.row].totalPrice ?? 0)
          
    orderData?[indexPath.row].option.forEach{
      miniListCell.miniSubMenuLable.text! += "+\($0.name) "
     // addPrice = addPrice + $0.
      nameArr.append($0.name)
    }
    print(addPrice)
    print(nameArr)
    
    totalOrderPriceWon.text = "\(String(((orderData?[0].totalPrice)! - 1000)))원"
   
   return miniListCell
  }
  
}


/* let rect = CGRect.init(origin: CGPoint.init(x: 20, y: 100), size: CGSize.init(width: 200, height: 100))
let layer = CAShapeLayer.init()
let path = UIBezierPath(roundedRect: rect, cornerRadius: 8)
layer.path = path.cgPath;
layer.strokeColor = UIColor.red.cgColor;
layer.lineDashPattern = [3,3];
layer.backgroundColor = UIColor.clear.cgColor;
layer.fillColor = UIColor.clear.cgColor;
self.view.layer.addSublayer(layer);*/
