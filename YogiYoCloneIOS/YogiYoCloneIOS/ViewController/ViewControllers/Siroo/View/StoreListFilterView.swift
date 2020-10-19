//
//  StoreListFilterView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Foundation
import SnapKit

protocol StoreListFilterViewDelegate : class {
    func presentStorefilterView(selectedOrder: Int, selectedPayment: Int)
}

class StoreListFilterView: UIView {

//    MARK:  Properties
    
    var selectedOrder = 0
    var selectedPayment = 0
    weak var filterViewDelegate: StoreListFilterViewDelegate?
    
    
    private var storeFilterBigView: StoreFilterbigView?    
    private let indicatorView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let filterLabel : UILabel = {
        let label = UILabel()
        label.text = "필터"
        label.font = UIFont(name: FontModel.customSemibold, size: 18)
        return label
    }()
    
    private let closeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.imageView?.tintColor = .black
        button.addTarget(self, action: #selector(filtercloseButton), for: .touchUpInside)
        return button
    }()
    
    private let setinit : UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(setInitButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private let horizontalIndicator : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let verticalIndicator : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
        
    private let enterButton : UIButton = {
        let button = UIButton()
        button.setTitle("적용", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(enterButtontaped), for: .touchUpInside)
        button.backgroundColor = ColorPiker.customRed
        button.titleEdgeInsets = UIEdgeInsets(top: -50, left: 0, bottom: 0, right: 0)
        return button
    }()

    private let filterselectedview : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
        
    }()
    
    private var orderArrayButtons : [UIButton] = []
    private var paymentArrayButtons : [UIButton] = []
    
    private let filterbutton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor( .darkGray, for: .normal)
        button.imageView?.tintColor = .darkGray
        button.setTitle("요기요 랭킹순", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customMedium, size: 15)
        button.addTarget(self, action: #selector(orderfilterButtontaped), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    private let filterbutton2 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor( .darkGray, for: .normal)
        button.imageView?.tintColor = .darkGray
        button.setTitle("배달 요금순", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customMedium, size: 15)
        button.addTarget(self, action: #selector(orderfilterButtontaped), for: .touchUpInside)
        button.tag = 1
        return button
    }()

    private let filterbutton3 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor( .darkGray, for: .normal)
        button.imageView?.tintColor = .darkGray
        button.setTitle("별점순", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customMedium, size: 15)
        button.addTarget(self, action: #selector(orderfilterButtontaped), for: .touchUpInside)
        button.tag = 2
        return button
    }()

    private let filterbutton4 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor( .darkGray, for: .normal)
        button.imageView?.tintColor = .darkGray
        button.setTitle("리뷰 많은순", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customMedium, size: 15)
        button.addTarget(self, action: #selector(orderfilterButtontaped), for: .touchUpInside)
        button.tag = 3
        return button
    }()

    
    private let filterbutton5 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor( .darkGray, for: .normal)
        button.imageView?.tintColor = .darkGray
        button.setTitle("최소 주문 금액순", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customMedium, size: 15)
        button.addTarget(self, action: #selector(orderfilterButtontaped), for: .touchUpInside)
        button.tag = 4
        return button
    }()

    private let filterbutton6 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .darkGray
        button.setTitleColor( .darkGray, for: .normal)
        button.setTitle("결제수단 전체", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customMedium, size: 15)
        button.addTarget(self, action: #selector(paymentfilterButtontaped(_:)), for: .touchUpInside)
        button.tag = 0
        return button
    }()

    private let filterbutton7 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor( .darkGray, for: .normal)
        button.imageView?.tintColor = .darkGray
        button.setTitle("현금", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customMedium, size: 15)
        button.addTarget(self, action: #selector(paymentfilterButtontaped), for: .touchUpInside)
        button.tag = 1
        return button
    }()

    private let filterbutton8 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor( .darkGray, for: .normal)
        button.imageView?.tintColor = .darkGray
        button.setTitle("현장카드", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customMedium, size: 15)
        button.addTarget(self, action: #selector(paymentfilterButtontaped), for: .touchUpInside)
        button.tag = 2
        return button
    }()

    private let filterbutton9 : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor( .darkGray, for: .normal)
        button.imageView?.tintColor = .darkGray
        button.setTitle("요기서결제", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customMedium, size: 15)
        button.addTarget(self, action: #selector(paymentfilterButtontaped), for: .touchUpInside)
        button.tag = 3
        return button
    }()
    
 //    MARK:  LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUiSet()
        orderArrayButtons.append(filterbutton)
        orderArrayButtons.append(filterbutton2)
        orderArrayButtons.append(filterbutton3)
        orderArrayButtons.append(filterbutton4)
        orderArrayButtons.append(filterbutton5)
        
        
        paymentArrayButtons.append(filterbutton6)
        paymentArrayButtons.append(filterbutton7)
        paymentArrayButtons.append(filterbutton8)
        paymentArrayButtons.append(filterbutton9)
        
        selectChosenOrder(selectedOrder)
        selectChosenPayment(selectedPayment)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    MARK:  Configure
    func configUiSet() {
        
        backgroundColor = .white
        addSubview(indicatorView)
        indicatorView.addSubview(filterLabel)
        
        
        [horizontalIndicator,verticalIndicator,closeButton,setinit,enterButton].forEach({
            self.addSubview($0)
        })
        
        horizontalIndicator.snp.makeConstraints { (make) in
            make.top.equalTo(filterLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(0)
            make.width.equalTo(self.frame.width)
            make.height.equalTo(0.5)
        }
        
        verticalIndicator.snp.makeConstraints { (make) in
            make.top.equalTo(horizontalIndicator.snp.bottom)
            make.bottom.equalTo(0)
            make.leading.equalTo(self.snp.centerX)
            make.width.equalTo(0.5)
        }
        
        filterLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(10)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(filterLabel.snp.centerY)
            make.bottom.top.equalTo(filterLabel)
            make.leading.equalTo(self.snp.leading).inset(10)
        }
        
        setinit.snp.makeConstraints { (make) in
            make.centerY.equalTo(filterLabel.snp.centerY)
            make.bottom.top.equalTo(filterLabel)
            make.trailing.equalTo(self.snp.trailing).inset(10)
            
        }
        
        enterButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.centerY).multipliedBy(1.3)
            make.leading.trailing.equalTo(0)
            make.bottom.equalToSuperview().inset(50)
        }
        
        
        let stack2 = UIStackView(arrangedSubviews: [filterbutton,filterbutton2,filterbutton3,filterbutton4,filterbutton5])
        stack2.axis = .vertical
        stack2.distribution = .fillProportionally
        stack2.spacing = 8
        stack2.alignment = .leading
        

        
        addSubview(stack2)
        stack2.snp.makeConstraints { (make) in
            make.top.equalTo(horizontalIndicator.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).inset(50)
        }
        
        let stack3 = UIStackView(arrangedSubviews: [filterbutton6,filterbutton7,filterbutton8,filterbutton9])
        stack3.axis = .vertical
        stack3.distribution = .fillProportionally
        stack3.spacing = 8
        stack3.alignment = .leading
        
        addSubview(stack3)
        stack3.snp.makeConstraints { (make) in
            make.top.equalTo(horizontalIndicator.snp.bottom).offset(10)
            make.leading.equalTo(verticalIndicator.snp.leading).inset(50)
        }

    }
    
    func selectChosenOrder(_ index: Int) {
        let selectedButton = orderArrayButtons[index]
        selectedButton.setTitleColor(.red, for: .normal)
        selectedButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        selectedButton.imageView?.tintColor = .systemRed
    }
    
    func selectChosenPayment(_ index: Int) {
        let selectedButton = paymentArrayButtons[index]
        selectedButton.setTitleColor(.red, for: .normal)
        selectedButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        selectedButton.imageView?.tintColor = .systemRed
    }
    
    func setFilterView(view: StoreFilterbigView) {
        storeFilterBigView = view
    }
        
    
    
//    MARK: Selector

    @objc func setInitButtonClicked() {
        for i in orderArrayButtons {
            i.setTitleColor( .darkGray, for: .normal)
            i.setImage(UIImage(systemName: "circle"), for: .normal)
            i.tintColor = .darkGray
        }
        selectChosenOrder(0)

        for i in paymentArrayButtons {
            i.setTitleColor( .darkGray, for: .normal)
            i.setImage(UIImage(systemName: "circle"), for: .normal)
            i.tintColor = .darkGray
        }
        selectChosenPayment(0)
  
    }

    
    @objc func filtercloseButton() {
        storeFilterBigView?.removeFromSuperview()
    }
    
    @objc func orderfilterButtontaped(_ sender: UIButton) {
        // 선택된 필터 이외 필터의 초기화 컬러설정
        let image = UIImage(systemName: "circle")
        for i in orderArrayButtons {
            i.setTitleColor( .darkGray, for: .normal)
            i.setImage(image, for: .normal)
            i.imageView?.tintColor = .darkGray
        }
        
        // 클릭이 확인되면, selectedorder 함수를 실행하여 선택된 필터에만 빨간색 적용
        selectedOrder = sender.tag
        selectChosenOrder(sender.tag)

    }

    
    @objc func paymentfilterButtontaped(_ sender: UIButton){
        for i in paymentArrayButtons {
            i.setTitleColor( .darkGray, for: .normal)
            i.setImage(UIImage(systemName: "circle"), for: .normal)
            i.imageView?.tintColor = .darkGray

        }
        selectedPayment = sender.tag
        selectChosenPayment(sender.tag)
        
    }
    
    @objc func enterButtontaped(_ sender: UIButton){
        /* 이벤트 발생
         리스너 : StoreVC의 카테고리 확인(StoreVC 의 Delegate) + FilterVC의 selected.tag를 확인!
         이벤트 발생하면,
        */
        self.filterViewDelegate?.presentStorefilterView(selectedOrder: selectedOrder, selectedPayment: selectedPayment)
        storeFilterBigView?.removeFromSuperview()

    }
}
