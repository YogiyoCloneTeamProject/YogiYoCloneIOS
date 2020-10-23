//
//  searchTableDelegate.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit


extension SearchVC : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = DidSearchVC()

    let index = data!.results?[indexPath.row]
    let searchData = DidSearchData(next: data!.next, previous: data!.previous, results: [DidSearchData.Results(id: index!.id, name: index?.name, star: index?.star, image: index?.image, deliveryDiscount: index?.deliveryDiscount, deliveryCharge: index?.deliveryCharge, deliveryTime: index?.deliveryTime, reviewCount: index?.reviewCount, representativeMenus: index?.representativeMenus, ownerCommentCount: index?.ownerCommentCount)])
    
    self.searchList = searchData
    
    
    guard let searchList = self.searchList else {return}

    //데이터 모델에 검색 보여진 아이들 배열에 전달
    self.searchMager.showMeSearchs(search: [searchList])
    print("self",searchList)
    
    
    
    
    navigationController?.pushViewController(vc, animated: true)
  

  }
}
