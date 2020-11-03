//
//  MapTableViewDelegate.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/05.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import GooglePlaces

extension MapVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? NearestListCustomCell else { return }
        if !cell.removeButton.isHidden {
            
            if let mainVC = presentingViewController as? MainTabVC {
                if let homeNaviVC = mainVC.children[0] as? UINavigationController {
                    if let homeVC = homeNaviVC.children[0] as? HomeVC {
                        
                        homeVC.titleButton.setTitle("\(addressList[indexPath.row - 1].load.dropFirst(6)) ▼", for: .normal)
                    }
                }
            }
                    
            navigationController?.dismiss(animated: true)
        } else {
            let lat = CLLocationDegrees(addressData?.documents[indexPath.row - 1].roadAddress.lat ?? "0") ?? 0
            let lon = CLLocationDegrees(addressData?.documents[indexPath.row - 1].roadAddress.lon ?? "0") ?? 0

            let address = addressData?.documents[indexPath.row - 1].addressName ?? ""
            let road = addressData?.documents[indexPath.row - 1].roadAddress
            let roadName = "[도로명] \(road?.region1 ?? "") \(road?.region2 ?? "") \(road?.region3 ?? "")"
            
            
            pushGoogle(address: address, road: roadName, lat: lat, lon: lon)
        }
    }
}
