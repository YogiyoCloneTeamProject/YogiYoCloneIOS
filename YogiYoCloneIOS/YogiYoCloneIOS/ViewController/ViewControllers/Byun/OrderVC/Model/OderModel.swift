//
//  OderModel.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit


// 전체 주문 메뉴를 관리하는 데이터 모델
class OrderManager {
  
  static let shared = OrderManager()
  var orderList: [OrderData] = []
  
  //선택된 메뉴들이 무엇인지
  func selectedMenus(menus: [OrderData]) {
    // orderList 배열에 저장하기
    orderList = menus
  }
  
  //실제 선택된 메뉴 정보 주세요
  func showMeOrderedList() -> [OrderData] {
    // 오더메뉴 정보를 리턴
    return orderList
  }
  
  //선택된 메뉴를 모두 초기화
  func resetOrderList(){
    orderList.removeAll()
  }
  
  func totalPrice() -> Int{
    var total = 0
    print("오더리스트갯수 확인: ", orderList.count)
    orderList.forEach
    {
      total += $0.price
      $0.option.forEach{
        total += $0.price
      }
    }
    return 10000
  }
  
}
