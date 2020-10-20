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
  var searchList: SearchDataload?
  
  var data : DidSearchData?
  //var testArr = [DidSearchData]()
  
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
    
    //  navigationItem.rightBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelDidTab( _:)))
  }
  
  //MARK:- Aactions
  @objc func searchDidTab(_ sender: UIButton){
    
  }
  
  @objc func cancelDidTab(_ sender: UIButton){
    self.resignFirstResponder()
  }
  
  @objc func textfieldDid(_ sender : UITextField){
    
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
    
  
 // let datai = ["롯데리아","버거킹","치요남치킨","요거프레소","호식이두마리치킨","홍콩반점0410","홈플러스익스프레스","호치킨", "피자헛","맥도날드"]
 // let datai : [String] = []
//  let dataa : [String] = []
//  var filterData : [String]!
  
  //MARK: -fechData
  
  //함수가 끝날 때 completion으로 DidSearchData를 반환한다.
  func fechData(text : String?, completion: @escaping ((DidSearchData) -> Void)){
    
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
      cell.textLabel?.text = data?.results?[indexPath.row].name

      return cell
      
    }
    
  }

extension SearchVC : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = DidSearchVC()
    navigationController?.pushViewController(vc, animated: true)
  
    //  filterData.removeAll()
    
   // let searchData = SearchData(id: , name: <#T##String?#>)
    
    var ii = data?.results
    print("ii",ii)
    
//    var item = data?.results![indexPath.row]
//    var searchData = DidSearchData.Results(id: item?.id, name: item?.name, star: item?.star, image: item?.image, deliveryDiscount: item?.deliveryCharge, deliveryCharge: item?.deliveryCharge, deliveryTime: item?.deliveryTime, reviewCount: item?.reviewCount, representativeMenus: item?.representativeMenus, ownerCommentCount: item?.ownerCommentCount)
   
    
 //   print("searchData : \(searchData)")
   
    //  vc.menuValue(orderData: orderData)
    
  }
}
