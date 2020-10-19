//
//  BottomView.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/09/01.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MenuListVCBottomView: UIView {
    
    // MARK: Properties
    let touchOrderButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("터치 주문", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 30, right: 0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    
    let callOrderButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(red: 171/255, green: 40/255, blue: 38/255, alpha: 1)
        button.setTitle("전화 주문", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 30, right: 0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [callOrderButton, touchOrderButton].forEach {
            addSubview($0)
        }
        
        callOrderButton.snp.makeConstraints { (make) in
            make.top.bottom.left.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.25)
        }
        
        touchOrderButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.75)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
