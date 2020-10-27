//
//  MapTableViewDelegate.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/05.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension MapVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard indexPath.row != 0 else { return print("return") }
        
        let address = addressData?.documents[indexPath.row - 1].addressName ?? ""
        let load = addressData?.documents[indexPath.row - 1].roadAddress
        let loadStr = "[도로명] \(load?.region1 ?? "") \(load?.region2 ?? "") \(load?.region3 ?? "")"
        
        let addressValue: Address = Address(address: address, load: loadStr)
        
        addressList.append(addressValue)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(addressList) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: MapVC.listString)
        }
        
        
        let googleVC = GoogleMapVC()
        navigationController?.pushViewController(googleVC, animated: true)
        print("push")
    }
}
