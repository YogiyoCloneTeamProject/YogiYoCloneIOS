//
//  DetailMenuVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//
import UIKit
import SwiftyJSON
import Kingfisher


class DetailMenuVC: UIViewController {
  
  public var id : Int = 20
  
    // 전체적인 주문 정보를 관리하는 매니저(데이터 모델)
    var orderMager = OrderManager.shared
    
    // 주메뉴를 담기 위한 변수
  var orderlist: OrderData?
    
  var data: MenuData?
  
  let clipLable : UILabel = {
    let l = UILabel()
    l.backgroundColor = .black
    l.textColor = .white
    l.text = "URL복사가 완료되었습니다."
    l.textAlignment = .center
    l.layer.borderWidth = 3
    l.layer.borderColor = ColorPiker.customSystem.cgColor
    l.layer.cornerRadius = 15
    l.layer.masksToBounds = true
    l.alpha = 0
    return l
  }()
  
  let costView = CostView()
  let tableView = UITableView()
  
  lazy var rightButton = UIBarButtonItem(image: UIImage(systemName: "tray.and.arrow.up"), style: .plain, target: self, action: #selector(shareButton))
  lazy var leftButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissButton))
  
  //MARK:- life
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setTableView()
    clipboradMessag()
    setNaviBar()
    fechData()
    buttonFrame()
    
    }

  
  //MARK:- Popup Options
  func clipboradMessag(){
    clipLable.frame = CGRect(x: 40, y: 700, width: view.frame.width - 80, height: 44)
    view.addSubview(clipLable)
  }
  
  func clipAnimation(){
    UIView.animate(withDuration: 1, animations: {
      self.clipLable.alpha = 1
      self.clipAnimationLess()
    })
  }
  func clipAnimationLess(){
    UIView.animate(withDuration: 0.7, animations: {
      self.clipLable.alpha = 0
    })
  }
  
  //MARK:- Frame
  func costViewFrame(){
    costView.frame = CGRect(x: 0, y: view.frame.maxY - 50, width: view.frame.width, height: 50)
    view.addSubview(costView)
  }
  
  func buttonFrame(){
    orderButton.frame = CGRect(x: view.frame.width/2, y: view.frame.maxY, width: view.frame.width/2, height: -50)
    view.addSubview(orderButton)
    
    orderaddButton.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width/2, height: -50)
    view.addSubview(orderaddButton)
  }
  
  
  let orderaddButton : UIButton = {
    let b = UIButton()
    b.backgroundColor = .darkGray
    b.setTitle("주문표에 추가", for: .normal)
    b.setTitleColor(.white, for: .normal)
    b.titleLabel?.font = FontModel.toSize.customFont
    return b
  }()
  
  let orderButton : UIButton = {
    let b = UIButton()
    b.backgroundColor = ColorPiker.customMainRed
    b.setTitle("주문 하기", for: .normal)
    b.setTitleColor(.white, for: .normal)
    b.titleLabel?.font = FontModel.toSize.customFont
    b.addTarget(self, action: #selector(orderDidTab(_:)), for: .touchUpInside)
    return b
  }()
  
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  
  func fechData(){
    let url = URL(string: "http://52.79.251.125/menu/\(String(id))")
    URLSession.shared.dataTask(with: url!)  { (data, _, _) in
      guard let data = data else { return }
      do {
        self.data = try JSONDecoder().decode(MenuData.self, from: data)
        // 메뉴데이터 <=====> 오더데이터
        // 오더데이터 만들기
        let id = self.data?.id
        let name = self.data?.name
        let price = self.data?.price
        
        // item에 OrderData요소 할당
        let item = OrderData(menu: id!, name: name!, count: 1, price: price!)
        
        //orderlist에 item할당
        // 주문정보 하나 담기(주메뉴)
        self.orderlist =  item
        
        DispatchQueue.main.async{
          self.tableView.reloadData()
        }
      } catch {
        print("catch")
      }
    }.resume()
  }
  
 
  
  //MARK:- UITableView
  func setTableView(){
    
    tableView.dataSource = self
    tableView.delegate = self
    
   // tableView.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y-88, width: self.view.frame.size.width, height: self.view.frame.size.height+88)
    navigationBarLess()
    
    tableView.rowHeight = UITableView.automaticDimension //동적높이
    // tableView.estimatedRowHeight = 0
    tableView.backgroundColor = .white
    tableView.separatorStyle = .none
    view.addSubview(tableView)
    register()
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    
  }
  //MARK:-register
  func register(){
    tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "ImageTableViewCell")//0
    tableView.register(SaleTableViewCell.self, forCellReuseIdentifier: "SaleTableViewCell")//1
    tableView.register(NameTableViewCell.self, forCellReuseIdentifier: "NameTableViewCell")//2
    tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")//3
    tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: "ReviewTableViewCell")//4
    tableView.register(CostTableViewCell.self, forCellReuseIdentifier: "CostTableViewCell")//5
    tableView.register(ListMenuTableViewCell.self, forCellReuseIdentifier: "ListMenuTableViewCell")//5-1
    tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")//6
    tableView.register(ListOptionTableViewCell.self, forCellReuseIdentifier: "ListOptionTableViewCell")//6-1
    tableView.register(OptionTableViewCell.self, forCellReuseIdentifier: "OptionTableViewCell")//7
    tableView.register(BuyTableViewCell.self, forCellReuseIdentifier: "BuyTableViewCell")//8
    tableView.register(BuyLastTableViewCell.self, forCellReuseIdentifier: "BuyLastTableViewCell")//8-1
    tableView.register(NilCell.self, forCellReuseIdentifier: "NilCell")
  }
  
  
  //MARK: -navigation
  
  func setNaviBar(){
    navigationItem.leftBarButtonItem = leftButton
    navigationItem.rightBarButtonItems = [rightButton]
  }
  
  
  func navigationBarLess(){
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  //MARK: -Action
  //닫기
  @objc func dismissButton(sender : UIBarButtonItem){
     dismiss(animated: true, completion: nil)
  //  navigationController?.popViewController(animated: true)
  }
  //공유하기
  @objc func shareButton(sender : UIBarButtonItem){
    let vc = ShareVC()
    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .overFullScreen
    present(vc, animated: true, completion: nil)
  }
  //주문하기
  @objc func orderDidTab(_ sender : UIButton){
    let vc = OderVC()

    //화면 이동시 테이블뷰의 최상단으로 강제 이동(뷰가 잘리는 부분 임시 처리)
    let indexPath = NSIndexPath(row: 0, section: 0)
    self.tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: false)
    
    guard let orderlist = self.orderlist else {return}
    
    // 데이터모델에 선택된 아이템을 전달
    orderMager.selectedMenus(menus: [orderlist])
    
   // let orderData = OrderData(menu: data!.id, name: data!.name, count: 1, price: data!.price)
    
  //  vc.menuValue(orderData: orderData)
    
    navigationController?.pushViewController(vc, animated: true)
  }
  
  //주문표에 추가
  @objc func orderaddDidTab(){
    
  }
  
}

