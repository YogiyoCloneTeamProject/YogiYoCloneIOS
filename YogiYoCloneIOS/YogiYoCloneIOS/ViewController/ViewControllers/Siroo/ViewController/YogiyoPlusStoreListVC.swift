//
//  YogiyoPlusStoreListVC.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/11.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

protocol YogiyoStoreListVCDelegate : class {
    func scrollViewAction(to index: Int)
}

private let reuseIdentifier = "StoreListCell"

//public let scrollView = UIScrollView()


class YogiyoPlusStoreListVC: UIViewController, CustomTopCategoryViewDelegate, RestaurantModelProtocol , UIScrollViewDelegate , categoryVCdelegate {
  
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
    
    private let titleStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = CollectionDesign.textPadding
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    private let naviTitle : UILabel = {
        let label = UILabel()
        label.text = "요기요 플러스"
        label.font =  UIFont(name: FontModel.customLight, size: 18)
        return label
    }()
    
    private let titleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("성수동2가 277-17 ▼", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customLight, size: 5)
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(mapPresent(_ :)), for: .touchUpInside)
        return button
    }()

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
    
        fetchModel.delegate = self
        configure()
        congigureSetUI()
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
        self.navigationController?.navigationBar.shadowImage = UIImage()
        title = "요기요 플러스 성수동2가 277-17 ▼"
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
    
    @objc func testButtonAction(sender: UIButton) {
        scrollView.setContentOffset(CGPoint(x: self.view.frame.width, y: 0), animated: true)
    }
    
    @objc func mapPresent(_ sender: UIButton) {
        let mapVC = UINavigationController(rootViewController: MapVC())
        mapVC.modalPresentationStyle = .fullScreen
        present(mapVC, animated: true)
        print("mapClick")
    }
    
    //    MARK: fetch event
    func restaurantRetrived(restaurants: [AllListData.Results], index: Int , isFirst : Bool) {
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

    func congigureSetUI(){
        titleStack.addArrangedSubview(naviTitle)
        titleStack.addArrangedSubview(titleNavigationButton)
        
        navigationItem.titleView = titleStack
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
extension YogiyoPlusStoreListVC : StoreListFilterViewDelegate {
    // 필터 정렬 이벤트 리스너
    func presentStorefilterView(selectedOrder: Int, selectedPayment: Int) {
        fetchModel.getRestaurnatData(categoryIndex, selectedOrder: selectedOrder, selectedPayment: selectedPayment, isFirst: true)
    }

}

