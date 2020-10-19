//
//  UIScrollViewDelegate.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

//MARK:- UIScrollViewDelegate
//스크롤뷰 제어
extension DetailMenuVC: UIScrollViewDelegate{
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y < 1 {
      scrollView.contentOffset.y = 1
    }
    if scrollView.contentOffset.y >= 260 {
      title = "\(data!.name)"
      self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "back"), for: .any, barMetrics: .default)
      [leftButton,rightButton].forEach{
        $0.tintColor = .black
      }
    }else {
      navigationBarLess()
      title = ""
      [leftButton,rightButton].forEach{ $0.tintColor = .lightGray }

    }
    // print(scrollView.contentOffset.y)
  }
}



