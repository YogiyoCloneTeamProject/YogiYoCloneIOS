//
//  TableViewData.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension LikeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if likeData == nil {
            return 1
        } else {
            return (likeData?.results.count ?? 1) + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let height = view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        
        if likeData == nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NilViewCustomCell.identifier) as? NilViewCustomCell else { fatalError() }
            tableView.rowHeight = height
            cell.nilButton.addTarget(self, action: #selector(pushlistVC(_:)), for: .touchUpInside)
            
            return cell
        } else {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CountHeaderCell.identifier) as? CountHeaderCell else { fatalError() }
                cell.setValue(count: likeData?.results.count ?? 0)
                
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: StoreListCell.identifier) as? StoreListCell else { fatalError() }
                let row = indexPath.row - 1
                cell.setValue(image: likeData?.results[row].image,
                              title: likeData?.results[row].name,
                              starPoint: likeData?.results[row].star,
                              review: likeData?.results[row].reviewCount,
                              discount: likeData?.results[row].deliveryDiscount,
                              explain: likeData?.results[row].representativeMenus)
                cell.cescoMark.addTarget(self, action: #selector(removeLike(_:)), for: .touchUpInside)
                
                return cell
            }
        }
    }
}
