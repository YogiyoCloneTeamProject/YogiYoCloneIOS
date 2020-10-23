//
//  StoreListCell.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
import Kingfisher

class StoreListCell: UITableViewCell {
    var restaurant: AllListData.Results?
    
    static let identifier = "StoreListCell"
    
    //    MARK: Properties
    let storeImage : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let storeNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customLight, size: 18)
        return label
    }()
    
    private let starImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        return imageView
    }()
    
    let storeRateLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: FontModel.customSemibold, size: 12)
        label.textColor = .black
        return label
    }()
    
    
    let reviewLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customLight, size: 12)
        label.textColor = .systemGray
        return label
    }()
    
    let bestMenuLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customLight, size: 12)
        label.textColor = .systemGray
        return label
    }()
    
    let estimatedTime : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: FontModel.customLight, size: 12)
        label.textColor = .darkGray
        return label
    }()
    
    let cescoMark : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cesco"), for: .normal)
        button.tintColor = .systemRed
        button.isSelected = true
        return button
    }()
    
    let deliveryDiscountLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customLight, size: 12)
        label.textColor = .red
        return label
    }()
    
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    //    MARK:  LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setUIConstraints()
        print("deliveryDiscountLabel :\(String(describing: restaurant?.deliveryDiscount))")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setCell() {
        setUIConstraints()
    }
    
    //    MARK: SetUIConstraints
    
    private func setUIConstraints () {
        
        [storeImage,cescoMark,estimatedTime,storeNameLabel,starImage,storeRateLabel,deliveryDiscountLabel,reviewLabel,bestMenuLabel].forEach({
            contentView.addSubview($0)
        })
        
        storeImage.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().inset(20)
            make.width.equalTo(self.snp.width).multipliedBy(0.2)
            make.height.equalTo(storeImage.snp.width)
        }
        
        cescoMark.snp.makeConstraints { (make) in
            make.top.equalTo(storeImage.snp.top)
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(storeNameLabel.snp.trailing)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.1)
            make.height.equalTo(storeImage.snp.height).multipliedBy(0.35)
        }
        
        estimatedTime.snp.makeConstraints { (make) in
            make.trailing.equalTo(cescoMark.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom).inset(20)
        }
        
        storeNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(storeImage)
            make.leading.equalTo(storeImage.snp.trailing).offset(20)
            make.trailing.equalTo(cescoMark.snp.leading)
            make.width.equalTo(80)
        }
        
        
        starImage.snp.makeConstraints { (make) in
            make.top.equalTo(storeNameLabel.snp.bottom).offset(1)
            make.leading.equalTo(storeNameLabel.snp.leading)
            make.width.height.equalTo(contentView.snp.width).multipliedBy(0.05)
        }
        
        storeRateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(starImage.snp.top)
            make.leading.equalTo(starImage.snp.trailing).offset(3)
        }
        
        
        reviewLabel.snp.makeConstraints { (make) in
            make.top.equalTo(storeRateLabel.snp.top)
            make.leading.equalTo(storeRateLabel.snp.trailing)
        }
        
        setData()
        
        deliveryDiscountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(starImage.snp.bottom).offset(1)
            make.leading.equalTo(starImage.snp.leading)
        }
        
        estimatedTime.snp.makeConstraints { (make) in
            make.top.equalTo(deliveryDiscountLabel.snp.bottom).offset(1)
            make.trailing.equalToSuperview().inset(20)
        }
        
        bestMenuLabel.snp.makeConstraints { (make) in
            make.top.equalTo(deliveryDiscountLabel.snp.bottom).offset(1)
            make.leading.equalTo(deliveryDiscountLabel.snp.leading)
            make.trailing.equalTo(estimatedTime.snp.leading)
            make.bottom.equalToSuperview().inset(20)
            make.width.equalTo(180)
        }
        
        if restaurant?.deliveryDiscount == 0 {
            deliveryDiscountLabel.removeFromSuperview()
        }
    }
    
//    MARK: Set Cell Data
    
    func setData() {
        storeNameLabel.text = restaurant?.name
        storeRateLabel.text = "\(restaurant?.averageRating ?? 0.0)"
        setImage(from: restaurant?.image ?? "")
        reviewLabel.text = " ・ 리뷰 \(String(restaurant?.reviewCount ?? 0))"
        deliveryDiscountLabel.text = "배달할인 \(String(((restaurant?.deliveryDiscount ?? 0)!)) )원"
        estimatedTime.text = restaurant?.deliveryTime
        bestMenuLabel.text = restaurant?.representativeMenus.joined()
    }
    
//    MARK:  Set Store Image
 
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        storeImage.kf.setImage(with: imageURL)
    }
    
//    MARK: Set Value : LikeVC 에서 셀 재사용
    
    
    func setValue(image: String?, title: String?, starPoint: Double?, review: Int?, discount: Int?, explain: String?) {
        
        let discountText = formatter.string(from: discount as NSNumber? ?? 0)
        
        discountText != "0" ? (deliveryDiscountLabel.text = "배달할인 \(discountText ?? "0")원") :
            (deliveryDiscountLabel.text = nil)
        
        setImage(from: image ?? "")
        storeNameLabel.text = title
        storeRateLabel.text = "\(starPoint ?? 0)"
        reviewLabel.text = " ・ 리뷰 \(review ?? 0)"
        bestMenuLabel.text = explain
        cescoMark.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
    }
    
  
  //    MARK: searchValue : SearchVC 에서 셀 재사용
  
    func searchValue(image: String?, title: String?, starPoint: Double?, review: Int?, discount: Int?, explain: String?) {
        
        let discountText = formatter.string(from: discount as NSNumber? ?? 0)
        
        discountText != "0" ? (deliveryDiscountLabel.text = "배달할인 \(discountText ?? "0")원") :
            (deliveryDiscountLabel.text = nil)
        
        setImage(from: image ?? "")
        storeNameLabel.text = title
        storeRateLabel.text = "\(starPoint ?? 0)"
        reviewLabel.text = " ・ 리뷰 \(review ?? 0)"
        bestMenuLabel.text = explain
    }
}
