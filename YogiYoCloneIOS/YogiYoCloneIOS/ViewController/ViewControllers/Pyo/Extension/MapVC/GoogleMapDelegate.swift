//
//  GoogleMapDelegate.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/30.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import GoogleMaps

extension GoogleMapVC: CLLocationManagerDelegate, GMSMapViewDelegate {
//맵을 계속 움직일 때 호출
    /*func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        print("이동2")
    }*/
     
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        
    }
     
    //맵이 이동을 끝낸 후 호출 나는 이걸 사용할것이다.
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        //중심점 위도 경도 구하기. position.target.latitude position.target.longitude
       
         
        //지오코딩으로 주소 구하기
        geocoder.reverseGeocodeCoordinate(position.target) { (response, error) in
            guard error == nil else {
                return
            }
            
            if let result = response?.firstResult() {
                
                self.bottomView.addressLabel.text = String(result.lines?[0].dropFirst(5) ?? "")
                
                var count = 0
                let addValue = [(result.country?.count ?? nil),
                                (result.administrativeArea?.count ?? nil),
                                (result.subLocality?.count ?? nil),
                                (result.locality?.count ?? nil)]
                    
                addValue.forEach { (Int) in
                    count += Int ?? -1
                 }
                count += addValue.count
                
                self.homeVCTitle = String(result.lines?[0].dropFirst(count) ?? "")
            }
        }
    }
}
