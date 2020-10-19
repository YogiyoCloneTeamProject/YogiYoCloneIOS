//
//  MenListService.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/09/13.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Alamofire

extension MenuListVC {
    
    // GET Store Info Service
    func storeInfoService(selfVC: MenuListVC, id: Int) {
        AF.request("http://52.79.251.125/restaurants/\(String(id))", method: .get, encoding: URLEncoding.default).response { (response) in
            
            if let error = response.error {
                print("----- AF RESPONSE ERROR [GET] (STORE INFO)----- \(error.localizedDescription)")
            }
            
            guard let code = response.response?.statusCode else { return }
            
            if code >= 200, code <= 299 {
                switch response.result {
                    
                case .success(let data):
                    guard let data = data else {return}
                    do {
                        let json = try JSONDecoder().decode(RestaurantInstanceData.self, from: data)
                        self.storeInfo = json
                        print("----- AF RESULT SUCCESS [GET] (STORE INFO)----- ")
                        
                    } catch let error {
                        print("----- JSONDecoder ERROR (STORE INFO)-----  \(error.localizedDescription)")
                    }
                    
                case .failure(let error):
                    print("----- AF RESULT FAIL [GET] (STORE INFO)----- \(error.localizedDescription)")
                }
                
            } else if code >= 400, code <= 499 {
                print("----- AF STATUS CODE IS 400 ~ 499 [GET] (STORE INFO)----- ")
            } else {
                print("----- AF STATUS CODE IS 500 ~ [GET] (STORE INFO)----- ")
            }
        }
    }
}
