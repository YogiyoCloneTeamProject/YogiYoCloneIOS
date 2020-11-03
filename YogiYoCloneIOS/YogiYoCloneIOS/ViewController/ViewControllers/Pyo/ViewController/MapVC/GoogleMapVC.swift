//
//  GoogleMapVC.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/27.
//  Copyright © 2020 김동현. All rights reserved.
// 마북로

import UIKit
import GoogleMaps
import GooglePlaces

class GoogleMapVC: UIViewController {
    
    private let mapView: GMSMapView = {
        let camera = GMSCameraPosition()
        let map = GoogleMaps.GMSMapView.map(withFrame: .zero, camera: camera)
        
        return map
    }()
    private let yogiPoint: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "location.circle")
        imageView.tintColor = .systemRed
        
        return imageView
    }()
    
    let bottomView = GoogleBottomView()
    
    let locationManager = CLLocationManager()
    let geocoder = GMSGeocoder()
    
    var lat: CLLocationDegrees?
    var lon: CLLocationDegrees?
    var addressList: [Address] = []
    
    var homeVCTitle = "title"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let savedList = UserDefaults.standard.object(forKey: MapVC.listString) as? Data {
            if let loadedList = try? JSONDecoder().decode([Address].self, from: savedList) {
                
                addressList = loadedList
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    private func setUI() {
        
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(popBack(_:)))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize:16, weight: .light)]
        
        
        
        mapView.addSubview(yogiPoint)
        
        mapView.camera = GMSCameraPosition.camera(withLatitude: lat ?? 0, longitude: lon ?? 0, zoom: 17)
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        view.addSubview(mapView)
        
        bottomView.setButton.addTarget(self, action: #selector(dismissMap(_:)), for: .touchUpInside)
        view.addSubview(bottomView)
    }
    private func setLayout() {
        
        mapView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(mapView.snp.width).multipliedBy(1.375)
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(mapView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        yogiPoint.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.center.equalTo(mapView)
        }
    }
    @objc func popBack(_ sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
    @objc func dismissMap(_ sender: UIBarButtonItem) {
        
        let address = "\(bottomView.addressLabel.text ?? "") \(bottomView.textField.text ?? "")"
        
        guard addressList.filter({ $0.address == address }).count == 0 else {

            navigationController?.dismiss(animated: true)
            return
        }
        
        let addressValue: Address = Address(address: address, load: bottomView.roadLabel.text ?? "")
        
        addressList.insert(addressValue, at: 0)
        
        if let encoded = try? JSONEncoder().encode(addressList) {
            
            UserDefaults.standard.set(encoded, forKey: MapVC.listString)
        }
        if let mainVC = presentingViewController as? MainTabVC {
            if let homeNaviVC = mainVC.children[0] as? UINavigationController {
                if let homeVC = homeNaviVC.children[0] as? HomeVC {
                    
                    homeVC.titleButton.setTitle("\(homeVCTitle) ▼", for: .normal)
                }
            }
        }
        navigationController?.dismiss(animated: true)
    }
}
