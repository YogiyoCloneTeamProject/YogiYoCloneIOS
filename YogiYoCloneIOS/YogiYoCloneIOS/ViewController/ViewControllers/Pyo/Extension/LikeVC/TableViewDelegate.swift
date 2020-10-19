//
//  TableViewDelegate.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/02.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension LikeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard indexPath.row != 0 else { return }
        
        let menuVC = MenuListVC()
        menuVC.id = likeData?.results[indexPath.row - 1].id ?? 0
        navigationController?.pushViewController(menuVC, animated: true)
        
        return
    }
}
