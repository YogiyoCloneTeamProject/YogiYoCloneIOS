//
//  HistoryDetailVC.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/29.
//  Copyright © 2020 김믿음. All rights reserved.
//

import UIKit
import SnapKit


class HistoryDetailVC: UIViewController {
    
    // leading, trailing padding
    private let padding = 20

//    MARK: LifeCycle
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
        let orderStatusSection = drawSection(parentView: scrollView, prev: reOrderButton)
        let orderInfoSection = drawSection(parentView: scrollView, prev: orderStatusSection)
        let menusSection = drawSection(parentView: scrollView, prev: orderInfoSection)
        let totalAmountSection = drawSection(parentView: scrollView, prev: menusSection, lightTopLine: true)
        let checkoutAmountSection = drawSection(parentView: scrollView, prev: totalAmountSection)
        let payMethodSection = drawSection(parentView: scrollView, prev: checkoutAmountSection)
        
        let orderStatusLine = drawBigStackLine(parentView: orderStatusSection)
        
        let orderStatusContents = drawBigStackLine(parentView: orderStatusSection)
        

        let orderContents = [
            ["주문번호", "200829-17-360880"],
            ["주문시간", "2020-10-06 07:24" ],
            ["접수대기중", "접수 대기중 입니다."],
        ]
        
        let menuTitleContents = ["（4다리）불닭볶음치킨 X 1", "20,000원"]
        
        
        var prev: UIStackView?
        for content in orderContents {
            prev = drawStackLine(content: content, parentView: orderInfoSection, prev: prev)
        }
        
        let menulistLine = drawMediumStackLine(content: menuTitleContents, parentView: menusSection)
        
        let totalAmountLine = drawTotalAmountStackLine(content: ["상품합계","20,000원"], parentView: totalAmountSection)
        
        let payMethodLine = drawTotalAmountStackLine(content: ["결제방식","현금"], parentView: payMethodSection)
        
        let paymentStackLine = drawPaymentStackLine(content: ["결제금액","20,000원"], parentView: checkoutAmountSection)

    }
    
    // Section
    func drawSection(parentView: UIView, prev: UIView, lightTopLine: Bool = false) -> UIView {
        let sectionView = SectionView()
        if lightTopLine {
            sectionView.setTopLine()
        }
        
        parentView.addSubview(sectionView)
        sectionView.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }
    
        self.commonConstraints(target: sectionView, to: parentView, prev: prev)
        return sectionView
    }
    

    // stackSmallLine 보이는 부분
    func drawStackLine(content: [String], parentView: UIView, prev: UIView?) -> UIStackView {
        let stack = StackSmall()
        stack.contents(label: content[0], value: content[1])
        parentView.addSubview(stack)
        stack.snp.makeConstraints { (make) in
            if (prev != nil) {
                make.top.equalTo(prev!.snp.bottom).inset(0)
            } else {
                make.top.equalTo(parentView).inset(10)
            }
        }
        fillLayoutConstraints(target: stack, to: parentView)
        return stack
    }
    
    // stackBigLine 보이는 부분
    func drawBigStackLine(parentView: UIView) -> UIView {
        let view = StackBig()
        parentView.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.top.equalTo(parentView).inset(20)
            make.centerY.equalTo(parentView.snp.centerY)
        }
        
        fillLayoutConstraints(target: view, to: parentView)
        return view
    }
    
    // StackMediumLine 보이는 부분
    func drawMediumStackLine(content: [String],parentView: UIView) -> UIStackView {
        let stack = StackMedium()
        stack.contents(label: content[0], value: content[1])
        parentView.addSubview(stack)
        stack.snp.makeConstraints { (make) in
            make.centerY.equalTo(parentView).offset(10)
        }
        
        fillLayoutConstraints(target: stack, to: parentView)
        return stack
    }

    // 최종 결제금액 부분
    func drawPaymentStackLine(content: [String],parentView: UIView) -> UIStackView {
        let stack = PaymentLine()
        stack.contents(label: content[0], value: content[1])
        parentView.addSubview(stack)
        stack.snp.makeConstraints { (make) in
            make.centerY.equalTo(parentView).offset(10)
        }
        
        fillLayoutConstraints(target: stack, to: parentView)
        return stack
    }
    
    // 결제 방식 & 상품 금액 합계 부분
    func drawTotalAmountStackLine(content: [String],parentView: UIView) -> UIStackView {
        let stack = CenterLine()
        stack.contents(label: content[0], value: content[1])
        parentView.addSubview(stack)
        stack.snp.makeConstraints { (make) in
            make.centerY.equalTo(parentView).offset(10)
        }
        
        fillLayoutConstraints(target: stack, to: parentView)
        return stack
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
            make.leading.equalTo(parentView)
        }
        return storeView
    }
    
    // 재주문 버튼
    func drawReOrderButton(parentView: UIView, prev: UIView) -> ReOrderButton {
        let reOrderButton = ReOrderButton()
        parentView.addSubview(reOrderButton)
        reOrderButton.snp.makeConstraints { (make) in
            make.top.equalTo(prev.snp.bottom).multipliedBy(0.5)
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

