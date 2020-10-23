//
//  DidSTableViewDataSource.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit


extension DidSearchVC : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    searchList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "StoreListCell", for: indexPath) as! StoreListCell
    
    let search = searchList[indexPath.row].results
    let searchRetrun = searchMager.retunArray()
    let searchArr = search?[searchRetrun]
    
    let imageurl = URL(string: searchArr?.image ?? "")
    
    cell.storeImage.kf.setImage(with: imageurl)
    cell.storeNameLabel.text = searchArr?.name ?? ""
    cell.storeRateLabel.text = String(searchArr?.star ?? 0.0)
    cell.reviewLabel.text = " ・ 리뷰\(  String(searchArr?.reviewCount ?? 0))"
    cell.bestMenuLabel.text = searchArr?.representativeMenus ?? ""
    cell.estimatedTime.text = searchArr?.deliveryTime
    cell.deliveryDiscountLabel.text = "배달할인   \(searchArr?.deliveryDiscount ?? 0)원"
  
    return cell
  }
}

