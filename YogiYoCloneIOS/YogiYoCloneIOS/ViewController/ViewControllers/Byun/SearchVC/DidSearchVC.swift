//
//  DidSearchVC.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/06.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class DidSearchVC : UIViewController {
  
  //public var restaurants: [AllListData.Results] = []
  var data : DidSearchData?
  var word : String = ""
    
  let searchfield = UITextField()
  let topView = TopView()
  let tableV = UITableView()

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.titleView = searchfield
    view.backgroundColor = .yellow
    
    setNavi()
    setSearchfield()
    setTableView()
    topViewFrame()
    constrain()
    
//    loadData { (DidSearchData) in
//        self.didSearchdata = DidSearchData
//        DispatchQueue.main.async {
//            self.setUI()
//            self.setLayout()
//        }
 //   }
  }
  
  
  func fechData(){
    //\(word.self)
    let url = URL(string: "http://52.79.251.125/restaurants?/tags?name=")
    URLSession.shared.dataTask(with: url!)  { (data, _, _) in
      guard let data = data else { return }
      do {
        self.data = try JSONDecoder().decode(DidSearchData.self, from: data)
       print(data)
        
        
//        let id = self.data?.id
//        let name = self.data?.name
//        let averageRating = self.data?.averageRating
//        let image = self.data?.image
//        let deliveryDiscount = self.data?.deliveryDiscount
//        let deliveryCharge = self.data?.deliveryCharge
//        let deliveryTime = self.data?.deliveryTime
//        let reviewCount = self.data?.reviewCount
        let representativeMenus = self
        
        
       // let searchList = SearchData(id: id!, name: name!, averageRating: averageRating!, image: image!, deliveryDiscount: deliveryDiscount!, deliveryCharge: deliveryCharge!, deliveryTime: deliveryTime!, reviewCount: reviewCount!, representativeMenus: [String]())
   
        
        DispatchQueue.main.async{
       // self.tableView.reloadData()
        }
      } catch {
        print("catch")
      }
    }.resume()
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
      
     // title: "취소", style: .plain, target: self, action: #selector(canceltoDidTab( _:)))
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
    //tableview.delegate = self
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

extension DidSearchVC : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "StoreListCell", for: indexPath) as! StoreListCell
//    let vc =
//      vc.searchValue
    
    let row = indexPath.row
//    cell.searchValue(image: DidSearchData?.results[row].image,
//                  title: DidSearchData?.results[row].name,
//                  starPoint: DidSearchData?.results[row].star,
//                  review: DidSearchData?.results[row].reviewCount,
//                  discount: DidSearchData?.results[row].deliveryDiscount,
//                  explain: DidSearchData?.results[row].representativeMenus)
    
   // cell.restaurant = self.restaurants[indexPath.row]
    return cell
  }
  

}
