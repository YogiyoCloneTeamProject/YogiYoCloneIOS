//
//  OrderVC.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit


class OderVC : UIViewController {
  
  var orderMager = OrderManager.shared
  var orderList: [OrderData] = []
    
  lazy var leftButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapButton))
  
  public var id : Int = 1
  let tableView2 = UITableView()
  let pikerView = UIPickerView()
  var toolBar = UIToolbar()
  var userString = "요청사항을 선택하세요."
  let pikerList = ["요청사항을 선택하세요.","단무지/치킨무/반찬류 안 주셔도 돼요.","벨은 누르지 말아 주세요!","도착 후 전화주시면 직접 받으러 갈게요.", "그냥 문 앞에 놓아주시면 돼요.", "직접 입력"]
  var open = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    orderList = orderMager.showMeOrderedList()
    setTableView2()
    buttonFrame()
    //  navigation()
    title = "배달 주문 결제"
    //   fetchPosts()
    print("orderMager : \(orderMager.showMeOrderedList())")
    addTotal()
    
  }
  
  
  func viewDidappear(_ animated: Bool) {
    buttonFrame()
  }
  override func viewDidLayoutSubviews() {
    buttonFrame()
  }
  
  //MARK:- POST
  func onPostShowBible(){
    print("포스트 방식 데이터 가지러옴")
    let datalist = orderList
    guard let url = URL(string: "http://52.79.251.125/orders") else {return}
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    // 4. HTTP 메시지에 포함될 헤더 설정
    request.addValue("application/json", forHTTPHeaderField: "text/html")
    let body = "http://52.79.251.125/orders".data(using:String.Encoding.ascii, allowLossyConversion: false)
    
    request.httpBody = body
    
    // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 작성
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
      if let res = response{
        print(res)
      }
      if let data = data {
        do{
          let json = try JSONSerialization.jsonObject(with: data, options: [])

          let address = "address"
          let order_menu = self.orderList
          let payment_method = "payment_method"
          let restaurant = "restaurant"
          let total_price = "total_price"
          print(json)
          
          
        }catch{
          print(error)
        }
      }
      // 6. POST 전송
    }.resume()
  }
  
  
  let paymentButton : UIButton = {
    let b = UIButton()
    b.backgroundColor = ColorPiker.customMainRed
    b.setTitle("결제 하기", for: .normal)
    b.setTitleColor(.white, for: .normal)
    b.titleLabel?.font = UIFont(name: FontModel.customRegular, size: 23)
    b.addTarget(self, action: #selector(paymentDidTapButton(_:)), for: .touchUpInside)
    b.isHidden = true
    return b
  }()
  
  //MARK: -Navi
  func navigation(){
    title = "배달 주문 결제"
    navigationItem.leftBarButtonItem = leftButton
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "back"), for: .any, barMetrics: .default)
    navigationController?.navigationBar.backgroundColor = UIColor.white
  }
  
  //MARK:- Action
  //뒤로가기
  @objc func didTapButton(_ sender : UIButton){
    navigationController?.popViewController(animated: true)
  }
  //결제하기
  @objc func paymentDidTapButton(_ sender : UIButton){
    onPostShowBible()
    alertController()    
  }
  
  func buttonFrame(){
    paymentButton.frame = CGRect(x: view.frame.minX + 20, y: view.frame.maxY - 20, width: view.frame.width - 40, height: -50)
    //  paymentButton.center = view.center
    view.addSubview(paymentButton)
  }
  
  
  //MARK:- UITableView
  func setTableView2(){
    
    pikerView.delegate = self
    pikerView.dataSource = self
    
    tableView2.dataSource = self
    tableView2.delegate = self
    tableView2.frame = view.frame
    tableView2.rowHeight = UITableView.automaticDimension //동적높이
    tableView2.backgroundColor = .white
    //tableView2.separatorStyle = .none
    tableView2.clipsToBounds = true
    view.addSubview(tableView2)
    
    //CustomOderCell
    tableView2.register(loginCell.self, forCellReuseIdentifier: "loginCell")//0-비회원
    tableView2.register(InformationCell.self, forCellReuseIdentifier: "InformationCell")//1-0
    tableView2.register(CustomOrderCell.self, forCellReuseIdentifier: "CustomOrderCell")//1-1
    tableView2.register(PaywithCell.self, forCellReuseIdentifier: "PaywithCell")//2
    tableView2.register(MembershipCell.self, forCellReuseIdentifier: "MembershipCell")//3-회원
    tableView2.register(unMembershipCell.self, forCellReuseIdentifier: "unMembershipCell")//3-비회원
    //OrderListCell
    tableView2.register(OrderListCell.self, forCellReuseIdentifier: "OrderListCell") //주문결제내역
    tableView2.register(paymentCell.self, forCellReuseIdentifier: "paymentCell")
    
  }
  
  func addTotal() {
    //tableview IndexPath값에 직접 접근
    let index = IndexPath(row: 0, section: 4)
    //tableview row값에 직접 접근
    let cellForrow = tableView2.cellForRow(at: index)
    //타입캐스팅으로 BuyLastTableViewCell불러오기
    let ordercell = cellForrow as? OrderListCell
    ordercell?.totalOrderPriceWon.text = "플리즈"
    //"\(3500 + orderList[0].totalPrice!)"
    print("출력이 되나요?")
    // print(totalPrice())
  }
  
  func alertController(){
  
    let alert = UIAlertController(title: "알림", message: "⛳️주문이 완료되었습니다~!🏇🚣‍♂️~!🧘‍♂️ 배달이 시작됩니다.🛥🚁", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: { action in
      
     self.dismiss(animated: true)
    }))
    self.present(alert, animated: true, completion: nil)
  }
}


//MARK:-UITableViewDataSource
extension OderVC : UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:  //로그인 유무
      return 1
    case 1://주문자정보
      if open == false {
        return 2
      }else {
        return 2 + 1
      }
    case 2: //결제수단 선택
      return 1
    case 3: //할인방법 선택
      return 1
    case 4: //배달주문 내역
      return 1
    default:
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let loginCell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath) as! loginCell
      return loginCell
    case 1:
      switch indexPath.row {
      case 0:
        let InformationCell = tableView.dequeueReusableCell(withIdentifier: "InformationCell", for: indexPath) as! InformationCell
        return InformationCell
      case 1:
        let CustomOderCell = tableView.dequeueReusableCell(withIdentifier: "CustomOrderCell", for: indexPath) as! CustomOrderCell
        _ = false
        CustomOderCell.configure(title: "\(userString)")
        // print(userString)
        return CustomOderCell
        
      default:
        let unMembershipCell = tableView.dequeueReusableCell(withIdentifier: "unMembershipCell", for: indexPath) as!
          unMembershipCell
        return unMembershipCell
      }
    case 2:
      let PaywithCell = tableView.dequeueReusableCell(withIdentifier: "PaywithCell", for: indexPath) as! PaywithCell
      return PaywithCell
    case 3:
      let MembershipCell = tableView.dequeueReusableCell(withIdentifier: "MembershipCell", for: indexPath) as! MembershipCell
      return MembershipCell
    case 4:
      let OrderListCell = tableView.dequeueReusableCell(withIdentifier: "OrderListCell", for: indexPath) as! OrderListCell
      print("오더리스트셀 제발 알려주세요", indexPath)
      OrderListCell.orderData = orderList
      
      return OrderListCell
    case 5 :
      let paymentCell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! paymentCell
      return paymentCell
    default:
      let loginCell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath) as! loginCell
      return loginCell
    }
  }
}
//MARK:-UITableViewDelegate
extension OderVC : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath)
    guard let cell = tableView.cellForRow(at: indexPath) as? CustomOrderCell else {return}
    guard let index = tableView.indexPath(for: cell) else { return }
    
    
    //MARK:- pikerView
    if indexPath.section == 1 && indexPath.row == 1 {
      pikerView.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
      pikerView.backgroundColor = .white
      self.view.addSubview(pikerView)
      
      toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
      toolBar.barStyle = .default
      toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
      self.view.addSubview(toolBar)
      
    }
    
  }
  
  @objc func onDoneButtonTapped() {
  //  pikerView.reloadAllComponents()
    toolBar.removeFromSuperview()
    pikerView.removeFromSuperview()
    
  }
  
  //헤더
  func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    section == 0 ? " " : " "
  }
  
  //푸터뷰 높이
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    switch section{
    case 0:
      return 1
    case 1:
      return 10
    case 2:
      return 0
    case 3:
      return 10
    case 4:
      return 0
    default:
      return 0
    }
    
  }
}


extension OderVC : UISceneDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y > 800 {
      scrollView.contentOffset.y = 840
      paymentButton.isHidden = false
    }else{
      paymentButton.isHidden = true
    }
  }
}

