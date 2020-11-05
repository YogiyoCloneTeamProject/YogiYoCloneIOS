//

//  StackBig.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/11/03.
//  Copyright © 2020 김믿음. All rights reserved.
//

import UIKit


class StackBig: UIView {

    private let orderStatus : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        label.text = "접수대기"
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    
    private let delivery : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "OrderImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.isSelected = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.frame.size = CGSize(width: 10, height: 5)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        
        addSubview(orderStatus)
        orderStatus.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading)
        }
        addSubview(delivery)
        delivery.snp.makeConstraints { (make) in
            make.centerY.equalTo(orderStatus)
            make.trailing.equalTo(self.snp.trailing)
            make.width.equalTo(self.snp.width).multipliedBy(0.3)
            make.height.equalTo(20)
        }
        
    }
}

