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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
    }
    
    // MARK: layout view 만들기
    func configureView() {
        let wrapView = drawWrap(parentView: view)
        let closeButton: CloseButton = drawCloseButton(parentView: wrapView)
        let scrollView = drawScroll(parentView: wrapView, prev: closeButton)
        let storeView = drawStore(parentView: scrollView)
        let reOrderButton = drawReOrderButton(parentView: scrollView, prev: storeView)
    }
    
    // section
    func drawSection() {
        
    }
    
    // stack 한줄 한줄 보여주는 부분
    func drawStackLine() {
        
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
        let storeView = StoreButtonView()
        parentView.addSubview(storeView)
        storeView.snp.makeConstraints { (make) in
            make.top.equalTo(parentView).offset(20)
        }
        fillLayoutConstraints(target: storeView, to: parentView)
        return storeView
    }
    
    // 재주문 버튼
    func drawReOrderButton(parentView: UIView, prev: UIView) -> ReOrderButton {
        let reOrderButton = ReOrderButton()
        parentView.addSubview(reOrderButton)
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
