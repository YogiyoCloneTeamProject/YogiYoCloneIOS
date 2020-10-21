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
    print(index , "index")
    var searchData = DidSearchData(next: data!.next, previous: data!.previous, results: [DidSearchData.Results(id: index!.id, name: index?.name, star: index?.star, image: index?.image, deliveryDiscount: index?.deliveryDiscount, deliveryCharge: index?.deliveryCharge, deliveryTime: index?.deliveryTime, reviewCount: index?.reviewCount, representativeMenus: index?.representativeMenus, ownerCommentCount: index?.ownerCommentCount)])
    
    self.searchList = searchData
    
    
    guard let searchList = self.searchList else {return}

    //데이터 모델에 검색 보여진 아이들 배열에 전달
    self.searchMager.showMeSearchs(search: [searchList])
    print("self",searchList)
  //  print("ii", ii)
    
  //  let searchData = DidSearchData(next: data!.next, previous: data!.previous, results: [DidSearchData.Results(id: index!.id, name: index?.name, star: index?.star, image: index?.image, deliveryDiscount: index?.deliveryDiscount, deliveryCharge: index?.deliveryCharge, deliveryTime: index?.deliveryTime, reviewCount: index?.reviewCount, representativeMenus: index?.representativeMenus, ownerCommentCount: index?.ownerCommentCount)])
    
  
    //OrderData(menu: data!.id, name: data!.name, count: 1, price: data!.price)
    
  //  vc.searchValue(didSearchData: [DidSearchData]())
    
    navigationController?.pushViewController(vc, animated: true)
  
//보내는 곳

   // vc.searchValue()

  //  print("ii",ii)
    
    
    
//    var item = data?.results![indexPath.row]
//    var searchData = DidSearchData.Results(id: item?.id, name: item?.name, star: item?.star, image: item?.image, deliveryDiscount: item?.deliveryCharge, deliveryCharge: item?.deliveryCharge, deliveryTime: item?.deliveryTime, reviewCount: item?.reviewCount, representativeMenus: item?.representativeMenus, ownerCommentCount: item?.ownerCommentCount)
   
    
 //   print("searchData : \(searchData)")
   
    //  vc.menuValue(orderData: orderData)
    
  }
}
