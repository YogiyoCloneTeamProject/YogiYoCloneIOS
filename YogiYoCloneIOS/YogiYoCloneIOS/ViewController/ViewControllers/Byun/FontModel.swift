//
//  FontModel.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

struct FontModel{
  
  //UIFont Name
  static let customLight = "PingFangTC-Light"
  static let customRegular = "PingFangTC-Regular"
  static let customMedium = "PingFangTC-Medium"
  static let customSemibold = "PingFangTC-Semibold"


    struct toSize {
        //small
        static let customSmallFont = UIFont(name: FontModel.customLight, size: 13)
        // 하단 탭바 타이틀 & 매장 리스트 내 매장 셀의 별점/리뷰/대표메뉴/ 소요시간 / 최소 주문 시간 / 결제 방법/ 배달 요금
        
        //medium
        static let customFont = UIFont(name: FontModel.customSemibold, size: 18)//전화주문,터치주문
        
        static let customMediumFont = UIFont(name: FontModel.customMedium, size: 16) // 홈화면 매장 카테고리명, 홈화면 하단 커스텀 셀 내에 매장명
        
        //Large
        static let customLargeFont = UIFont(name: FontModel.customMedium, size: 18) // 상단 주소, 매장리스트 셀 내에 매장 명 ,홈 화면 하단 컬렉션 뷰 상단 제목 ex) "나의 입맛 저격"
        
    }
}
