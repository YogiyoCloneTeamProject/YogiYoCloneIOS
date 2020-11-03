//
//  DidSTableViewDalegate.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/23.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit


extension DidSearchVC : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = MenuListVC()
    let search = searchList[indexPath.row].results
    let searchRetrun = searchMager.retunArray()
    var searchArr = search?[searchRetrun]
    
    vc.id = searchArr?.id ?? 0
    
    navigationController?.pushViewController(vc, animated: true)
    navigationController?.navigationBar.tintColor = .gray
    tabBarController?.tabBar.isHidden = true
  
    
  }
}

