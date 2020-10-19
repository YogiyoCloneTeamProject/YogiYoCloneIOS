//
//  HistoryTableVC.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/10/03.
//  Copyright © 2020 김동현. All rights reserved.
//  파일 분리하면 문제가 생겨 일단 사용 안함
//

import UIKit

private let reuseIdentifier = "HistoryCell"

class HistoryTableDelegator : NSObject, UITableViewDataSource , UITableViewDelegate{

    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return 1
    //    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! HistoryCell
            return cell
        }
        
        //셀이 선택되었을때 실행할 액션(HistoryDetailVC 로 이동)
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        navigationController?.pushViewController(historyDetailVC, animated: true)
    //        print("터치가되나")
        }
        
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //      let height: CGFloat = scrollView.frame.size.height
    //      let contentYOffset: CGFloat = scrollView.contentOffset.y
    //      let scrollViewHeight: CGFloat = scrollView.contentSize.height
    //      let distanceFromBottom: CGFloat = scrollViewHeight - contentYOffset
    //
    //      if distanceFromBottom < height {
    //        categoryDelegate?.scrolltableviewreload()
    //        print("스크롤")
    //      }
    //    }
}


