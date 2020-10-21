//
//  SearchVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
//
class SearchVC: UIViewController {
  
  let searchfield = UITextField()
  let tableview = UITableView()
  
  //SearchData만 담기
  var searchList: DidSearchData?
  
  var data : DidSearchData?
  //매니저가져오기
  var searchMager = SearchManager.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    navigationItem.titleView = searchfield
    view.backgroundColor = .yellow
    setNavi()
    setSearchfield()
    setTableView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK:-Searchfield
  func setSearchfield(){
    searchfield.sizeToFit()
    searchfield.placeholder = "음식점이나 메뉴명으로 검색하세요."
    searchfield.keyboardType = .default
    searchfield.tintColor = .systemPink
    searchfield.becomeFirstResponder() //항시대기
    searchfield.sizeToFit()
    searchfield.clearButtonMode = .always
   // searchfield.delegate = self
    searchfield.addTarget(self, action: #selector(textfieldDid(_ :)), for: .editingChanged)
  }
  //MARK:- navi
  func setNavi(){
    navigationController?.navigationBar.barTintColor = .white
    //navigationController?.navigationBar.tintColor = .systemPink
    navigationController?.navigationBar.isTranslucent = true
    navigationController?.navigationBar.barStyle = .default
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchDidTab( _:)))
    navigationItem.leftBarButtonItem?.tintColor = .systemPink

  }
  
  //MARK:- Aactions
  @objc func searchDidTab(_ sender: UIButton){
    
  }
  
  @objc func cancelDidTab(_ sender: UIButton){
    self.resignFirstResponder()
  }
  
  @objc func textfieldDid(_ sender : UITextField){
    
    //2.반환한 데이터(DidSearchData)를 comeData에 넣고
    // textfieldDid가 될때마다 data = comData로 할당하면서, tablevieview도 리로드 되도록한다...
    fechData(text: searchfield.text ?? "") { (comeData) in
      self.data = comeData
      DispatchQueue.main.async {
        self.tableview.reloadData()
        
      }
    }
  }
    
    func setTableView(){
      tableview.dataSource = self
      tableview.delegate = self
      tableview.frame = view.frame
      tableview.rowHeight = 44
      tableview.backgroundColor = .white
      tableview.separatorStyle = .none
      tableview.clipsToBounds = true
      view.addSubview(tableview)
      
      tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
  
  
  //MARK: -fechData

  //1.함수가 끝날 때 completion으로 DidSearchData를 반환한다.
  func fechData(text : String?, completion: @escaping ((DidSearchData) -> Void)){

    var searcharray : [DidSearchData] = []
    //변환
    let urlString = "http://52.79.251.125/restaurants?search=\(text ?? "")"
    print("\(urlString)")
    guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else { return }
    var urlFragmentAllowed: CharacterSet
    let url = URL(string: encodedString)
    URLSession.shared.dataTask(with: url!) { (data, _, _) in
      guard let data = data else { return }
      do {
        let searchData = try JSONDecoder().decode(DidSearchData.self, from: data)
        completion(searchData)
//        var searchArray = try JSONDecoder().decode([DidSearchData].self, from: data)

        
        DispatchQueue.main.async{
          print("ddddd")
        }
      } catch {
        print("catch")
      }
    }.resume()
  }
  }

  
  
  extension SearchVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      data?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")! as UITableViewCell
      if searchfield.text != "" {
      cell.textLabel?.text = data?.results?[indexPath.row].name
      } else {
        tableview.reloadData()
      }
      return cell

    }
    
  }

extension SearchVC : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = DidSearchVC()

    let index = data!.results?[indexPath.row]
    print(index , "index")
    var searchData = DidSearchData(next: data!.next, previous: data!.previous, results: [DidSearchData.Results(id: index!.id, name: index?.name, star: index?.star, image: index?.image, deliveryDiscount: index?.deliveryDiscount, deliveryCharge: index?.deliveryCharge, deliveryTime: index?.deliveryTime, reviewCount: index?.reviewCount, representativeMenus: index?.representativeMenus, ownerCommentCount: index?.ownerCommentCount)])
    
    self.searchList = searchData
    
    
    guard let searchList = self.searchList else {return}

    //데이터 모델에 검색 보여진 아이들 배열에 전달
    self.searchMager.showMeSearchs(search: [searchList])
    print("self",searchList)
  //  print("ii", ii)
    
  //  let searchData = DidSearchData(next: data!.next, previous: data!.previous, results: [DidSearchData.Results(id: index!.id, name: index?.name, star: index?.star, image: index?.image, deliveryDiscount: index?.deliveryDiscount, deliveryCharge: index?.deliveryCharge, deliveryTime: index?.deliveryTime, reviewCount: index?.reviewCount, representativeMenus: index?.representativeMenus, ownerCommentCount: index?.ownerCommentCount)])
    
  
    //OrderData(menu: data!.id, name: data!.name, count: 1, price: data!.price)
    
  //  vc.searchValue(didSearchData: [DidSearchData]())
    
    navigationController?.pushViewController(vc, animated: true)
  
//보내는 곳

   // vc.searchValue()

  //  print("ii",ii)
    
    
    
//    var item = data?.results![indexPath.row]
//    var searchData = DidSearchData.Results(id: item?.id, name: item?.name, star: item?.star, image: item?.image, deliveryDiscount: item?.deliveryCharge, deliveryCharge: item?.deliveryCharge, deliveryTime: item?.deliveryTime, reviewCount: item?.reviewCount, representativeMenus: item?.representativeMenus, ownerCommentCount: item?.ownerCommentCount)
   
    
 //   print("searchData : \(searchData)")
   
    //  vc.menuValue(orderData: orderData)
    
  }
}
