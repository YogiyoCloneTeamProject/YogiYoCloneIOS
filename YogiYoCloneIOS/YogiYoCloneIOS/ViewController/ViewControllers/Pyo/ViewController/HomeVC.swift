//
//  HomeVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController, UIScrollViewDelegate {
    
    private let titleStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = CollectionDesign.textPadding
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    private let titleLogo: UIImageView = {
        let imageView = UIImageView()
        let imageViewWidth = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        let imageViewHeight = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        imageView.addConstraints([imageViewWidth, imageViewHeight])
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let titleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("성수동2가 277-17 ▼", for: .normal)
        return button
    }()
    
    private lazy var motherScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = ColorPiker.customGray
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    private let contentView = UIView()
    
    private lazy var topBannerView: BannerView = {
        let view = BannerView()
        view.bannerScrollView.delegate = self
        return view
    }()
    lazy var categoryCV: CategoryCollection = {
        let category = CategoryCollection()
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(CategoryCustomCell.self, forCellWithReuseIdentifier: CategoryCustomCell.identifier)
        return category
    }()
    
    lazy var firstCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.tag = 0
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "나의 입맛 저격!", image: "questionmark.circle")
        return category
    }()
    lazy var twiceCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.tag = 1
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "우리동네 찜♡ 많은 음식점", image: nil)
        return category
    }()
    
    private lazy var middleBannerView: BannerView = {
        let view = BannerView()
        view.bannerScrollView.delegate = self
        view.bannerScrollView.layer.cornerRadius = 5
        view.bannerScrollView.clipsToBounds = true
        return view
    }()
    
    lazy var thirdCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.tag = 2
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "성수동2가 오늘만 할인!!", image: nil)
        return category
    }()
    lazy var fourthCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.tag = 3
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(TripleRestaurantCustomCell.self, forCellWithReuseIdentifier: TripleRestaurantCustomCell.identifier)
        category.setValue(text: "요즘 뜨는 우리동네 음식점", image: "questionmark.circle")
        return category
    }()
    lazy var fifthCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.tag = 4
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "성수동2가 배달비 무료", image: nil)
        return category
    }()
    lazy var sixthCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.tag = 5
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "최근 7일 동안 리뷰가 많아요!", image: "questionmark.circle")
        return category
    }()
    lazy var seventhCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.tag = 6
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantPlusCustomCell.self, forCellWithReuseIdentifier: RestaurantPlusCustomCell.identifier)
        category.queryButton.addTarget(self, action: #selector(plusPush(_:)), for: .touchUpInside)
        category.setValue(text: "요기요플러스 맛집!", image: "더보기 〉")
        return category
    }()
    lazy var eighthCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.tag = 7
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "가장 빨리 배달돼요~", image: nil)
        return category
    }()
    lazy var ninthCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.tag = 8
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantNewCustomCell.self, forCellWithReuseIdentifier: RestaurantNewCustomCell.identifier)
        category.setValue(text: "새로 오픈했어요!", image: nil)
        return category
    }()
    
    var collectionData: [RecommendData?] = {
        let index = Array(1...9)
        var database = [RecommendData?]()
        index.forEach {_  in
            var data: RecommendData?
            database.append(data)
        }
//        var firstCD: RecommendData?
//        var twiceCD: RecommendData?
//        var thirdCD: RecommendData?
//        var fourthCD: RecommendData?
//        var fifthCD: RecommendData?
//        var sixthCD: RecommendData?
//        var seventhCD: RecommendData?
//        var eighthCD: RecommendData?
//        var ninthCD: RecommendData?

//        var database = [firstCD, twiceCD, thirdCD, fourthCD, fifthCD, sixthCD, seventhCD, eighthCD, ninthCD]
        
        return database
    }()
    
    private let buttonStack: BottomStack = {
        let view = BottomStack()
        view.buttons.forEach {
            $0.addTarget(self, action: #selector(stackPush(_:)), for: .touchUpInside)
        }
        return view
    }()
    
    private let bottomView = BottomView()
    
    private var constraint: Constraint?
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = .white
        tabBarController?.tabBar.isHidden = false
            }
    
    // MARK: Set UI
    private func setUI() {
        
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"),
                                                           style: .plain,
                                                           target: self,
                                                           action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        titleStack.addArrangedSubview(titleLogo)
        
        titleButton.addTarget(self, action: #selector(mapPresent(_:)), for: .touchUpInside)
        titleStack.addArrangedSubview(titleButton)
        
        navigationItem.titleView = titleStack
        
        view.addSubview(motherScrollView)
        
        motherScrollView.addSubview(contentView)
        
        contentView.addSubview(topBannerView)
        
        contentView.addSubview(categoryCV)
        contentView.addSubview(firstCV)
        contentView.addSubview(twiceCV)
        
        contentView.addSubview(middleBannerView)
        
        contentView.addSubview(thirdCV)
        contentView.addSubview(fourthCV)
        contentView.addSubview(fifthCV)
        contentView.addSubview(sixthCV)
        contentView.addSubview(seventhCV)
        contentView.addSubview(eighthCV)
        contentView.addSubview(ninthCV)
        
        contentView.addSubview(buttonStack)
        
        bottomView.companyButton.addTarget(self, action: #selector(companyAction(_:)), for: .touchUpInside)
        contentView.addSubview(bottomView)
    }
    
    // MARK: Auto Layout
    private func setLayout() {
        
        motherScrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.centerX.trailing.bottom.equalTo(motherScrollView)
        }
        
        topBannerView.snp.makeConstraints {
            $0.top.leading.equalTo(motherScrollView)
            $0.width.equalTo(motherScrollView)
            $0.height.equalTo(topBannerView.snp.width).multipliedBy(0.31)
        }
        
        
        categoryCV.snp.makeConstraints {
            $0.top.equalTo(topBannerView.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(categoryCV.snp.width).multipliedBy(0.61)
        }
        
        firstCV.snp.makeConstraints {
            $0.top.equalTo(categoryCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(firstCV.snp.width).multipliedBy(0.78)
        }
        
        twiceCV.snp.makeConstraints {
            $0.top.equalTo(firstCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(twiceCV.snp.width).multipliedBy(0.78)
        }
        
        
        middleBannerView.snp.makeConstraints {
            $0.top.equalTo(twiceCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.equalTo(CollectionDesign.padding)
            $0.width.equalTo(motherScrollView).offset(-CollectionDesign.padding * 2)
            $0.height.equalTo(middleBannerView.snp.width).multipliedBy(0.31)
        }
        
        
        thirdCV.snp.makeConstraints {
            $0.top.equalTo(middleBannerView.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(thirdCV.snp.width).multipliedBy(0.78)
        }
        
        fourthCV.snp.makeConstraints {
            $0.top.equalTo(thirdCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(fourthCV.snp.width).multipliedBy(0.98)
        }
        
        fifthCV.snp.makeConstraints {
            $0.top.equalTo(fourthCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(fifthCV.snp.width).multipliedBy(0.78)
        }
        
        sixthCV.snp.makeConstraints {
            $0.top.equalTo(fifthCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(sixthCV.snp.width).multipliedBy(0.78)
        }
        
        seventhCV.snp.makeConstraints {
            $0.top.equalTo(sixthCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(seventhCV.snp.width).multipliedBy(0.78)
        }
        
        eighthCV.snp.makeConstraints {
            $0.top.equalTo(seventhCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(eighthCV.snp.width).multipliedBy(0.78)
        }
        
        ninthCV.snp.makeConstraints {
            $0.top.equalTo(eighthCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(ninthCV.snp.width).multipliedBy(0.74)
        }
        
        
        buttonStack.snp.makeConstraints {
            $0.top.equalTo(ninthCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(buttonStack.snp.width).multipliedBy(0.58)
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(buttonStack.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(bottomView.snp.width).multipliedBy(0.45).priority(.medium)
            $0.bottom.equalTo(contentView).inset(CollectionDesign.padding)
            constraint = $0.height.equalTo(bottomView.snp.width).multipliedBy(0.85).priority(.low).constraint
        }
    }
    
    // MARK: Button func
    @objc func mapPresent(_ sender: UIButton) {
        let mapVC = UINavigationController(rootViewController: MapVC())
        mapVC.modalPresentationStyle = .fullScreen
        present(mapVC, animated: true)
    }
    
    @objc func stackPush(_ sender: UIButton) {
        guard sender.tag == 1 || sender.tag == 2 else {
            let listVC = StoreListVC()
            sender.tag < 3 ? (listVC.categoryIndex = sender.tag) : (listVC.categoryIndex = sender.tag - 2)
            navigationController?.pushViewController(listVC, animated: true)
            return
        }
        
        switch sender.tag {
        case 1:
            let plusVC = YogiyoPlusStoreListVC()
            navigationController?.pushViewController(plusVC, animated: true)
        case 2:
            print("take out")
        default:
            fatalError()
        }
    }
    @objc func plusPush(_ sender: UIButton) {
        let plusVC = YogiyoPlusStoreListVC()
        navigationController?.pushViewController(plusVC, animated: true)
    }
    func pushStore(store: Int) {
        let menuVC = MenuListVC()
        menuVC.id = store
        navigationController?.pushViewController(menuVC, animated: true)
    }
    @objc private func companyAction(_ sender: UIButton) {
        if !bottomView.toggle {
            sender.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            bottomView.companyInformation.padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            bottomView.companyInformation.text = category.companyInfo
            bottomView.constraint?.update(offset: CollectionDesign.padding)
            constraint?.update(priority: .high)
            bottomView.toggle = true
            
        } else {
            sender.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            bottomView.companyInformation.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            bottomView.companyInformation.text = nil
            bottomView.constraint?.update(offset: 0)
            constraint?.update(priority: .low)
            bottomView.toggle = false
        }
    }
}
