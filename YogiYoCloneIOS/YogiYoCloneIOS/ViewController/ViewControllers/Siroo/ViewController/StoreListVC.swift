//
//  StoreListVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

protocol StoreListVCDelegate : class {
    func scrollViewAction(to index: Int)
}

private let reuseIdentifier = "StoreListCell"

public let scrollView = UIScrollView()

//

class StoreListVC: UIViewController, CustomTopCategoryViewDelegate, RestaurantModelProtocol , UIScrollViewDelegate , categoryVCdelegate {
  
    //    MARK: Properties
    
    private let menuList = MenuListVC()
    private let scrollView = UIScrollView()
    
    // storeFilterbigView: StoreFilterbigView의 인스턴스 / 곧 addSubview로 화면에 보여질 인스턴스 <id: 1>
    public let storeFilterbigView = StoreFilterbigView()
    public let storeListFilterView = StoreListFilterView()
    
    public var categoryIndex : Int = 0
    
    private var scrollViewIndex : Int  = 0
    

    private let fetchModel = StoreinfoFetch()
    
    private var codeSegmented: CustomTopCategoryView?
    
    private let categories: [String] = StoreinfoFetch.categories
//        private let categoriesVC: [CategoryVC] = [CategoryVC](repeating: CategoryVC(), count: StoreinfoFetch.categories.count)
    
    private let categoriesVC: [CategoryVC] = [CategoryVC(), CategoryVC(), CategoryVC(), CategoryVC(), CategoryVC()]
    
    weak var delegate: StoreListVCDelegate?
    
    private let filterbutton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.cornerRadius = 20
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        button.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(.black, for: .normal)
        button.imageView?.tintColor = .black
        button.setTitle("필터", for: .normal)
        button.addShadow()
        button.titleLabel?.font = UIFont(name: FontModel.customSemibold, size: 18)
        button.addTarget(self, action: #selector(filterButtonTap), for: .touchUpInside)
        return button
    }()
    
    private let titleNavigationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("성수동2가 277-17 ▼", for: .normal)
        return button
    }()

    
    //    MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPiker.customSystem
        
        navigationController?.navigationBar.topItem?.title = ""
        title = "성수동2가 277-17 ▼"
        
        
        fetchModel.delegate = self
        configure()
        fetchModel.fetchAll()
        configureScrollView()
        configureFilterButton()
        
        categoryButtonScrollAction(to: categoryIndex)
        codeSegmented?.indexChangedListener(categoryIndex)
        
        for (_, vc) in categoriesVC.enumerated() {
            vc.categoryDelegate = self
        }
        
        
        storeListFilterView.filterViewDelegate = self
        storeFilterbigView.setStoreFilterView(storeListFilterView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .gray
        UIApplication.shared.statusBarStyle = .darkContent
        tabBarController?.tabBar.isHidden = false
        title = "성수동2가 277-17 ▼"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    
    func scrolltableviewreload() {
        // 두번째 페이지 부터 불러옴
        fetchModel.getRestaurnatData(categoryIndex,selectedOrder: storeListFilterView.selectedOrder, selectedPayment: storeListFilterView.selectedPayment, isFirst: false)
    }
    
    
    //    MARK:  Selector
    @objc private func didTapNext() {
        let menuListVC = MenuListVC()
        navigationController?.pushViewController(menuListVC, animated: true)
    }
    
    
    @objc func filterButtonTap(_ sender: UIButton) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tabCloseFilter))
        storeFilterbigView.addGestureRecognizer(tap)
        view.addSubview(storeFilterbigView)
        self.storeFilterbigView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.leading.trailing.equalToSuperview()
        }
        storeFilterbigView.showMenu()
    }
    
    @objc func tabCloseFilter() {
        storeFilterbigView.removeFromSuperview()
    }

    // Button Gesture 했을때 색상하는 Selector
    @objc func filterButtoncolorChange() {
        filterbutton.backgroundColor = .systemGray
    }
    
    //    MARK: fetch event
    func restaurantRetrived(restaurants: [AllListData.Results], index: Int , isFirst : Bool) {
        // 기존 로드된 매장리스트 + 새로 받은 매장리스트 (스크롤로 페이징할때 모두 보이게 하기 위해)
        // 필터 정렬시 : Restaurant리스트를 먼저 빈 값 [] 으로 넣어두고 다음조건으로 [] + 새로 불러온 Restarurant List 값을 더해준다. > (스크롤로 페이징할때 모두 보이게 하기 위해)
       // 1. 필터적용을 눌렀을때 첫번째 페이지부터 데이터가 다시 들어가게 하기 위해서는 기존의 첫번째 페이지의 데이터가 nil 값이 되도록 하는 장치가 있어야 한다.
        
        if isFirst == true {
            categoriesVC[index].restaurants = restaurants
            
        } else {
            categoriesVC[index].restaurants += restaurants
        }
        categoriesVC[index].reload()
    }
    
    //    MARK: Configure
    func configure() {
        codeSegmented = CustomTopCategoryView(frame: CGRect(x: 0, y: 80, width: view.frame.width, height: 50), categoryTitles: categories)
        codeSegmented?.backgroundColor = .white
        codeSegmented?.delegate = self
        view.addSubview(codeSegmented!)
        self.configureTableView()
        
    }
    
    func configureTableView() {
        for (index, vc) in categoriesVC.enumerated() {
            self.scrollView.addSubview(vc.configureTableView(index: index))
        }
    }
    
    @objc func testButtonAction(sender: UIButton) {
        scrollView.setContentOffset(CGPoint(x: self.view.frame.width, y: 0), animated: true)
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        
        scrollView.backgroundColor = .clear
        
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
            
        }
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: self.view.frame.width * 5, height: scrollView.frame.height)
        print("table 뷰의 \(scrollView.frame.height)")
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceVertical = false
        scrollView.showsHorizontalScrollIndicator = false
        
    }
    
    func configureFilterButton() {
        
        view.addSubview(filterbutton)
        filterbutton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    
    
    
//    MARK: Category에 따라 스크롤 이동 : category의 customView 를 delegate로 받음
    
    func categoryButtonScrollAction(to index: Int) {
        categoryIndex = index
        let offset: CGFloat = CGFloat(categoryIndex) * self.view.frame.width
        scrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
    
    func setIndex(_ offset: CGFloat) -> Int {
        return Int(offset / self.view.frame.width)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollIndex = setIndex(scrollView.contentOffset.x)
        if scrollIndex != categoryIndex {
            categoryIndex = scrollIndex
            codeSegmented?.indexChangedListener(categoryIndex)
        }
    }
    
//    MARK: Category delegate
    func categoryDelegate(id: Int) {
        let menuList = MenuListVC()
        menuList.id = id
        navigationController?.pushViewController(menuList, animated: true)
        navigationController?.navigationBar.tintColor = .gray
        tabBarController?.tabBar.isHidden = true
    }
    
}



extension StoreListVC : StoreListFilterViewDelegate {
    // 필터 정렬 이벤트 리스너
    func presentStorefilterView(selectedOrder: Int, selectedPayment: Int) {
        print("필터 정렬이 적용되었습니다 category: \(categoryIndex)")
        print("필터값 적용되었습니다 filter: \(selectedPayment)")
        print("정렬값 적용되었습니다 order: \(selectedOrder)")
        fetchModel.getRestaurnatData(categoryIndex, selectedOrder: selectedOrder, selectedPayment: selectedPayment, isFirst: true)
        print("필터정렬 이벤트 리스너 : \(fetchModel.getRestaurnatData(categoryIndex, selectedOrder: selectedOrder, selectedPayment: selectedPayment, isFirst: true))")

    }

    
    
}

