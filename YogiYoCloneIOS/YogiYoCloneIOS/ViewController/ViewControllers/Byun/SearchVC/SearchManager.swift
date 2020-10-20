//
//  SearchManager.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/20.
//  Copyright © 2020 김동현. All rights reserved.
//

import Foundation


class SearchManager {
  
  var searchList: [DidSearchData] = []
  
  
  //검색시 나열된 리스트를 배열에 저장
  func showMeSearchs(search: [DidSearchData]) {
    searchList = search
  }
  
  //써치리스트 리턴
  func selectSearch() -> [DidSearchData]{
    return searchList
  }
  
}
