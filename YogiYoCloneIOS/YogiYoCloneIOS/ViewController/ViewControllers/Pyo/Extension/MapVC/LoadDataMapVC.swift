//
//  LoadDataMapVC.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/27.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Alamofire

extension MapVC {
    
    func getAddress(keyword: String, complitionHandler: @escaping (RoadDocument?) -> Void) {
        print(keyword)
        
        let parameters: [String: Any] = ["query": keyword]
        let headers: HTTPHeaders = [ "Authorization": UrlBase.Authorization ]
        
        AF.request(UrlBase.addressKa,
                   method: .get,
                   parameters: parameters,
                   headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: RoadDocument.self) { (data) in
                
                self.addressData = data.value
                
                complitionHandler(data.value)
            }
    }
}
