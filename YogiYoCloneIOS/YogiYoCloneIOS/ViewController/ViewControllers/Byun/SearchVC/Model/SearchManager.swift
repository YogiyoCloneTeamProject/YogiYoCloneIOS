//
//  SearchManager.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/20.
//  Copyright © 2020 김동현. All rights reserved.
//

import Foundation


class SearchManager {
  
  //싱글톤
  static let shared = SearchManager()
  var searchList: [DidSearchData] = []
  
  
  //검색시 나열된 리스트를 배열에 저장
  func showMeSearchs(search: [DidSearchData]) {
    searchList = search
  }
  
  //선택 리턴
  func selectSearch() -> [DidSearchData]{
    return searchList
  }
  
  
  //배열 벗기기
  var number = 0
  func retunArray() -> Int {
    return number
  }
  
}
