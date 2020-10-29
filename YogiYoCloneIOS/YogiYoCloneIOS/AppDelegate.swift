//
//  AppDelegate.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/17.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Firebase
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let googleKey = "AIzaSyCCTguw0MZWkNcByROriYObSpmrDtiKs3w"
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        GMSServices.provideAPIKey(googleKey)
        GMSPlacesClient.provideAPIKey(googleKey)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTabVC()
//        window?.rootViewController = MapVC()

        window?.makeKeyAndVisible()
        return true
    }
    
}
