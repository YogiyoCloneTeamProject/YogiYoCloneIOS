//
//  LoadDataLikeVC.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/01.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension LikeVC {
    
    func loadData(complitionHandler: @escaping (LikeData) -> Void) {
        let apiurl = "\(UrlBase.ip)\(UrlBase.bookmarks)"
        print(apiurl)
        guard let urlJson = URL(string: apiurl) else { return print("error") }
        
        let dataTask = URLSession.shared.dataTask(with: urlJson) { data, response, error in
            guard error == nil else {return print(error!)}
            guard let response = response as? HTTPURLResponse,
                  (200 ..< 400).contains(response.statusCode) else { return }
            
            guard let data = data else { return print ("No Data") }
            let jsonDecoder = JSONDecoder()
            do {
                let data = try jsonDecoder.decode(LikeData.self, from: data)
                
                complitionHandler(data)
            } catch {
                print ("error: \(error)")
            }
        }
        dataTask.resume()
    }
}

