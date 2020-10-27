//
//  HistoryDetailVC.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/29.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit


class HistoryDetailVC: UIViewController {

    // leading, trailing padding
    private let padding = 20
    let storeView = StoreButtonView()
    
    private let orderStatus : UILabel = {
        let label = UILabel()
        label.text = "주문취소"
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        label.textColor = .darkGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
    }
    
    // MARK: layout view 만들기
    func configureView() {
        let wrapView = drawWrap(parentView: view)
        let closeButton: CloseButton = drawCloseButton(parentView: wrapView)
        let scrollView = drawScroll(parentView: wrapView, prev: closeButton).getContentsView()
        let storeView = drawStore(parentView: scrollView)
        let reOrderButton = drawReOrderButton(parentView: scrollView, prev: storeView)
        let cancelSection = drawSection(parentView: scrollView, prev: reOrderButton)
        let menusSection = drawSection(parentView: scrollView, prev: cancelSection)
        let totalAmountSection = drawSection(parentView: scrollView, prev: menusSection, lightTopLine: true)
        let checkoutAmountSection = drawSection(parentView: scrollView, prev: totalAmountSection)
        let payMethodSection = drawSection(parentView: scrollView, prev: checkoutAmountSection)
        
        
    }
    
    // Section
    func drawSection(parentView: UIView, prev: UIView, lightTopLine: Bool = false) -> UIView {
        let sectionView = SectionView()
        if lightTopLine {
            sectionView.lightLine()
        }
        
        parentView.addSubview(sectionView)
        sectionView.snp.makeConstraints { (make) in
            make.height.equalTo(100)
        }
        self.commonConstraints(target: sectionView, to: parentView, prev: prev)

        return sectionView
    }
    
    // stack 한줄 한줄 보여주는 부분
    func drawStackLine() {
        let stack = UIStackView(arrangedSubviews: [orderStatus])
    }
    
    // wrapView 그리기
    func drawWrap(parentView: UIView) -> WrapView {
        let wrapView = WrapView()
        parentView.addSubview(wrapView)
        wrapView.snp.makeConstraints { (make) in
            make.top.equalTo(parentView).offset(90)
            make.bottom.equalTo(parentView)
        }
        fillLayoutConstraints(target: wrapView, to: view)
        
        return wrapView
 
    }
    
    // 닫기 버튼
    func drawCloseButton(parentView: UIView) -> CloseButton {
        let closeButton = CloseButton()
        parentView.addSubview(closeButton)
        closeButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.leading.equalTo(parentView).offset(padding)
            make.top.equalTo(parentView).offset(20)
        }
        return closeButton
    }
    
    // 상세내용 스크롤뷰
    func drawScroll(parentView: UIView, prev: UIView) -> ContentsScrollView {
        let scrollView = ContentsScrollView()
        parentView.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(prev.snp.bottom)
            make.bottom.equalTo(parentView)
            make.leading.trailing.equalTo(parentView)
            make.left.right.equalTo(parentView).inset(20)
        }
        commonConstraints(target: scrollView, to: parentView, prev: prev, offset: 0)
        
        return scrollView
    }
    
    // 상점이름 및 링크
    func drawStore(parentView: UIView) -> StoreButtonView {
        parentView.addSubview(storeView)
        storeView.snp.makeConstraints { (make) in
            make.top.equalTo(parentView).offset(20)
            make.leading.equalTo(parentView)
        }
        return storeView
    }
    
    // 재주문 버튼
    func drawReOrderButton(parentView: UIView, prev: UIView) -> ReOrderButton {
        let reOrderButton = ReOrderButton()
        parentView.addSubview(reOrderButton)
        reOrderButton.snp.makeConstraints { (make) in
            make.top.equalTo(storeView.snp.bottom).multipliedBy(0.8)
        }
        loactedTopContsraints(target: reOrderButton, to: prev)
        return reOrderButton
    }
    
    // 일반적 section 공통 제약 조건
    func commonConstraints(target: UIView, to: UIView, prev: UIView, offset: Int = 20) {
        loactedTopContsraints(target: target, to: prev, offset: offset)
        fillLayoutConstraints(target: target, to: to)
    }
    
    // top margin 공통 autolayout 제약
    func loactedTopContsraints(target: UIView, to: UIView, offset: Int = 20) {
        target.snp.makeConstraints { (make) in
            make.top.equalTo(to.snp.bottom).offset(offset)
        }
    }
    
    // 가득채우는 width 공통 제약 조건
    func fillLayoutConstraints(target: UIView, to: UIView) {
        target.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(to)
        }
    }
    
}
