//
//  DidSearchVC.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/06.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Kingfisher

class DidSearchVC : UIViewController {
  
  
  var searchMager = SearchManager.shared
  private let menuList = MenuListVC()
  
  var searchList: [DidSearchData] = []
  var data : DidSearchData?

  let searchfield = UITextField()
  let topView = TopView()
  let tableV = UITableView()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.titleView = searchfield
    view.backgroundColor = .yellow
    
    searchList = searchMager.selectSearch()
    print("searchMager:" ,searchMager.selectSearch())
   // print("searchList: \(searchMager.showMeSearchs(search: [DidSearchData]()))")
    setNavi()
    setSearchfield()
    setTableView()
    topViewFrame()
    constrain()

  }
  
  
  //MARK:-Searchfield
  func setSearchfield(){
    searchfield.sizeToFit()
    searchfield.placeholder = "음식점이나 메뉴명으로 검색하세요."
    searchfield.keyboardType = .default
    searchfield.tintColor = .systemPink
     //항시대기
    searchfield.sizeToFit()
    searchfield.clearButtonMode = .always
    searchfield.delegate = self
  }
  func topViewFrame(){
    view.addSubview(topView)
    topView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  //MARK:- navi
  func setNavi(){
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.isTranslucent = true
    navigationController?.navigationBar.barStyle = .default
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(becomeSearchDidTab( _:)))
    navigationItem.leftBarButtonItem?.tintColor = .systemPink
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply.circle.fill"), style: .done, target: self, action: #selector(canceltoDidTab( _:)))
    navigationItem.rightBarButtonItem?.tintColor = .lightGray
      
  }
  
  //MARK:- Aactions
  
  @objc func becomeSearchDidTab(_ sender: UIButton){
    
  }
  
  @objc func canceltoDidTab(_ sender: UIButton){
    self.resignFirstResponder()
    navigationController?.popViewController(animated: true)
    
  }
  func setTableView(){
    
    tableV.dataSource = self
    tableV.delegate = self
    tableV.rowHeight = 120
    tableV.backgroundColor = .white
    tableV.separatorStyle = .singleLine
    tableV.clipsToBounds = true
    view.addSubview(tableV)
    
    tableV.register(StoreListCell.self, forCellReuseIdentifier: "StoreListCell")
  }


  func constrain(){
    tableV.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      topView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
      topView.heightAnchor.constraint(equalToConstant: 44),
      
      tableV.topAnchor.constraint(equalTo: topView.bottomAnchor),
      tableV.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
      tableV.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      
    ])
}
  
}
extension DidSearchVC : UITextFieldDelegate{
  func textFieldDidChangeSelection(_ textField: UITextField) {
    navigationController?.popViewController(animated: false)
  }
}

