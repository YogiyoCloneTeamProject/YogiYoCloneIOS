//
//  HistoryCell.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/10/03.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
import Kingfisher

class HistoryCell: UITableViewCell {

//    MARK: Properties
    
    var history: OrderListData.Results? {
        didSet {
            storeName.text = history?.restautantName
            historySetImage(from: history?.restautantImage ?? "")
            orderStatus.text = history?.status
            orderMenu.text = history?.orderMenu
            
        }
    }
    

    private let delivery : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "OrderImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.isSelected = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        return button
    }()
    
    private let orderTime : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customSemibold, size: 11)
        label.textColor = .systemGray
        label.text = "2020.09.25 03:39"
        return label
    }()
    
    private let orderStatus : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customSemibold, size: 15)
        label.textColor = .systemGray
        label.text = "주문완료"
        return label
    }()
    
    private let lineIndicator : UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray.cgColor
        return label
    }()
    
    private let storeImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testRestaurant")
        imageView.sizeToFit()
        return imageView
    }()
    
    private let storeName : UILabel = {
        let label = UILabel()
        label.text = "버거킹-성수점"
        label.font = UIFont(name: FontModel.customSemibold, size: 16)
        return label
    }()
    
    private let orderMenu : UILabel = {
        let label = UILabel()
        label.text = "불고기 와퍼 X 1"
        label.font = UIFont(name: FontModel.customRegular, size: 15)
        label.textColor = .systemGray
        return label
    }()
    
    private let reorderButton : UIButton = {
       let button = UIButton()
        button.setTitle("재주문", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customRegular, size: 14)
        button.setTitleColor(ColorPiker.customRed, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.borderWidth = 0.5
        button.layer.borderColor = ColorPiker.customRed.cgColor
        return button
    }()
    
    private let orderDetailButton : UIButton = {
       let button = UIButton()
        button.setTitle("주문상세", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customRegular, size: 14)
        button.titleLabel?.textAlignment = .center
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    
//    MARK: SetUIConstraints
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUIConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    MARK: SetUI
    private func setUIConstraints() {
        addSubview(delivery)
        delivery.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView).multipliedBy(4)
            make.centerY.equalTo(contentView).multipliedBy(9)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(contentView.snp.leading).offset(8)
            make.width.equalTo(100)
            make.height.equalTo(18)
        }
        
        addSubview(orderTime)
        orderTime.snp.makeConstraints { (make) in
            make.centerY.equalTo(delivery)
            make.leading.equalTo(delivery.snp.trailing).multipliedBy(1.1)
        }

        addSubview(orderStatus)
        orderStatus.snp.makeConstraints { (make) in
            make.centerY.equalTo(orderTime)
            make.trailing.equalTo(contentView).multipliedBy(18)
        }

        addSubview(lineIndicator)
        lineIndicator.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView).multipliedBy(18)
            make.centerX.equalTo(contentView).multipliedBy(10)
            make.width.equalTo(contentView.frame.width * 1.08)
            make.height.equalTo(0.5)
        }

        addSubview(storeImage)
        storeImage.snp.makeConstraints { (make) in
            make.leading.equalTo(delivery)
            make.centerY.equalTo(contentView).multipliedBy(42)
            make.width.height.equalTo(100)

        }

        addSubview(storeName)
        storeName.snp.makeConstraints { (make) in
            make.leading.equalTo(orderTime.snp.leading)
            make.top.equalTo(storeImage.snp.top)
        }

        addSubview(orderMenu)
        orderMenu.snp.makeConstraints { (make) in
            make.leading.equalTo(storeName.snp.leading)
            make.centerY.equalTo(contentView).multipliedBy(40)
        }

        addSubview(reorderButton)
        reorderButton.snp.makeConstraints { (make) in
            make.leading.equalTo(orderMenu.snp.leading)
            make.bottom.equalTo(storeImage.snp.bottom)
            make.width.equalTo(contentView.frame.width * 0.3)
            make.height.equalTo(contentView.frame.height * 0.8)
        }

        addSubview(orderDetailButton)
        orderDetailButton.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView).multipliedBy(12.5)
            make.bottom.equalTo(reorderButton.snp.bottom)
            make.width.equalTo(contentView.frame.width * 0.3)
            make.height.equalTo(contentView.frame.height * 0.8)
        }

    }
    
    
    func historySetImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        storeImage.kf.setImage(with: imageURL)
    }

}


