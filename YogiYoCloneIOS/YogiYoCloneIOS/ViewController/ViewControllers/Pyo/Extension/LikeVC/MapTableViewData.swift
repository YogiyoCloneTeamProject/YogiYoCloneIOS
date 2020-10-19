//
//  MapTableViewData.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/05.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension MapVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !topView.searchField.isSelected {
            
            return 2
        } else {
            
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !topView.searchField.isSelected {
            
            return falseCell(tableView: tableView, indexPath: indexPath)
        } else {
            
            return trueCell(tableView: tableView, indexPath: indexPath)
        }
    }
    
    private func falseCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NearestCustomCell.identifier) else { fatalError() }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NearestListCustomCell.identifier) else { fatalError() }
            
            return cell
        }
    }
    private func trueCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExplainCustomCell.identifier) else { fatalError() }
        
        return cell
    }
}
