//
//  buyDelegate.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension DetailMenuVC : buyDelegate {
  func plusdidTap(sender: UIButton, up: Int) {
    orderlist?.count = up
    reCalculatePriceAndDisplay()
  }
  
  func minusdidTap(sender: UIButton, down: Int) {
    orderlist?.count = down
    reCalculatePriceAndDisplay()
  }
  
  func reCalculatePriceAndDisplay() {
    let section1 = 2 + (data?.optionGroup.count)!
    
    //tableview IndexPath값에 직접 접근
    let indexxxxxx = IndexPath(row: 1, section: section1)
    
    //tableview row값에 직접 접근
    let cellForrow = tableView.cellForRow(at: indexxxxxx)
    //타입캐스팅으로 BuyLastTableViewCell불러오기
    let buycell = cellForrow as? BuyLastTableViewCell
    buycell?.costLable.text = "\(String(totalPrice()))원"
    print(totalPrice())
  }

}
