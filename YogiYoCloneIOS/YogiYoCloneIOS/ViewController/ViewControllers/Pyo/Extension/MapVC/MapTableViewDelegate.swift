//
//  MapTableViewDelegate.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/05.
//  Copyright © 2020 김동현. All rights reserved.
// 성수이로

import UIKit

extension MapVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? NearestListCustomCell else { return }
        if !cell.removeButton.isHidden {
            
            print("return")
        } else {
            
            let address = addressData?.documents[indexPath.row - 1].addressName ?? ""
            let load = addressData?.documents[indexPath.row - 1].roadAddress
            let loadName = "[도로명] \(load?.region1 ?? "") \(load?.region2 ?? "") \(load?.region3 ?? "")"
            
            guard addressList.filter({ $0.address == address }).count == 0 else { return pushGoogle() }
            
            let addressValue: Address = Address(address: address, load: loadName)
            
            addressList.insert(addressValue, at: 0)
            setList()
            
            
            pushGoogle()
        }
    }
}
