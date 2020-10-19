//
//  HistoryEmptyView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/29.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

protocol HistoryEmptyViewdelegate : class {
    func orderTapButton()
}

class HistoryEmptyView: UIView, UIScrollViewDelegate {
    
    private let emptyView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("주문하러 가기", for: .normal)
        button.backgroundColor = ColorPiker.customMainRed
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tapOrderButton), for: .touchUpInside)
        return button
    }()
    
    private let emptyImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "EmptyOrderListImage")
        return image
    }()
    
    private let kakaotalkButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = ColorPiker.customRed
        button.layer.cornerRadius = 30
        button.setImage(UIImage(named: "kakaoicon-1"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    weak var historyEmptyViewdelegate : HistoryEmptyViewdelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Func
    func configSetUI(index: Int) {
        
        addSubview(emptyView)
        emptyView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        emptyView.addSubview(emptyImage)
        emptyImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(emptyView)
            make.centerY.equalTo(emptyView.snp.centerY).multipliedBy(0.6)
            make.height.equalTo(200)
            make.width.equalTo(240)
        }
        
        emptyView.addSubview(orderButton)
        orderButton.snp.makeConstraints { (make) in
            make.top.equalTo(emptyImage.snp.bottom)
            make.leading.equalTo(emptyImage.snp.leading)
            make.width.equalTo(emptyImage.snp.width)
            make.height.equalTo(40)
        }
        
        emptyView.addSubview(kakaotalkButton)
        kakaotalkButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.centerY.equalTo(emptyView.snp.centerY).multipliedBy(1.35)
            make.centerX.equalTo(emptyView.snp.centerX).multipliedBy(1.75)
        }
    }
    
//    MARK: Selector
    
    @objc func tapOrderButton(_ sender: UIButton) {
        print("!!!!orderTap")
        historyEmptyViewdelegate?.orderTapButton()
    }
    
    @objc func tapkakaotalkButton(_ sender: UIButton) {
        print("KAKAO")
    }
    
    

}
