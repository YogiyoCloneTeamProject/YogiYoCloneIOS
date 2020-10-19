//
//  OderForOnePersonVC.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

private let reuseIdentifier = "StoreListCell"

protocol categoryVCdelegate: class {
    func categoryDelegate(id: Int)
    func scrolltableviewreload()

}

class CategoryVC: UIViewController {
    
    
    public var restaurants: [AllListData.Results] = []
//    private var categoryindex: Int?
    private let tableView = UITableView()
    weak var categoryDelegate : categoryVCdelegate?
    private var addDataCallCount: Int = 0

    
    //    MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func reload() {
        self.tableView.reloadData()
    }
    
    
    //    MARK: Config
    func configureTableView(index: Int) -> UIView {
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        tableView.register(StoreListCell.self, forCellReuseIdentifier: reuseIdentifier)
//        tableView.rowHeight = 120
        tableView.allowsSelection = true
        
        
        tableView.tableFooterView = UIView()
        
        let height = view.frame.height - 200
        let xPos: CGFloat = view.frame.width * CGFloat(index)
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        view.frame = CGRect(x: xPos, y: 0, width: 0, height: 0)
        view.sizeToFit()
        view.addSubview(tableView)
        
        
        print("뷰의 사이즈는 11:\(view.frame.height)")
        return view
    }
}

extension CategoryVC : UITableViewDataSource , UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "슈퍼레드위크 추천"
    }
    
    //헤더뷰
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .white
            headerView.backgroundView?.backgroundColor = .white
            headerView.textLabel?.textColor = .black
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let tableView = UITableView()
        headerView.backgroundColor = .white
        let headerLabel = UILabel(frame: CGRect(x: 18, y: 3, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        
        headerLabel.textColor = .black
        headerLabel.font = UIFont(name: FontModel.customSemibold, size: 18)
        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! StoreListCell
        cell.restaurant = self.restaurants[indexPath.row]
        return cell
    }
    
//셀이 선택되었을때 실행할 액션
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("안되나..")
        categoryDelegate?.categoryDelegate(id: self.restaurants[indexPath.row].id)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let height: CGFloat = scrollView.frame.size.height
      let contentYOffset: CGFloat = scrollView.contentOffset.y
      let scrollViewHeight: CGFloat = scrollView.contentSize.height
      let distanceFromBottom: CGFloat = scrollViewHeight - contentYOffset
                
      if distanceFromBottom < height {
        categoryDelegate?.scrolltableviewreload()
        print("스크롤")
      }
    }
 
}

