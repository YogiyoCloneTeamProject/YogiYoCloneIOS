//
//  HistoryInfoFetch.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/10/05.
//  Copyright © 2020 김동현. All rights reserved.
//

import Alamofire
import SwiftyJSON
import Foundation

protocol HistoryFetchProtocol {
    func historyRetrived(histories: [OrderListData.Results])
}

class HistoryInfoFetch {
    var historiesListData = [OrderListData?](repeating: nil, count: 2)
    
    var historyFetchDelegate : HistoryFetchProtocol?
    
    func historyFetch() {
        self.getHistoryData()
    }
    
    func getHistoryData() {
        var hs:
            [OrderListData.Results] = []
        AF.request(UrlBase.order,method: .get)
            .response { response in
                if response.data != nil {
                    let result = JSON(response.data!)
                    let histories = result["results"]
                    for (_, histories) in
                        histories {
                        let id = histories["id"].intValue
                        let orderMenu = histories["order_menu"].stringValue
                        let restaurantName = histories["restaurant_name"].stringValue
                        let restaurantImage = histories["restaurant_image"].stringValue
                        let status = histories["status"].stringValue
                        let orderTime = histories["order_time"].stringValue
                        let reviewWritten = histories["review_written"].boolValue
                        
                        hs.append(OrderListData.Results(id: id, orderMenu: orderMenu, restautantName: restaurantName, restautantImage: restaurantImage, status: status, orderTime: orderTime, reviewWritten: reviewWritten))
                    }
                    
                    self.historiesListData = [OrderListData(next: result["next"].stringValue, previous: result["previous"].stringValue, results: hs)]
                }
                self.historyFetchDelegate?.historyRetrived(histories: hs )
            }
    }
}
