//
//  NearestListCustomCell.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/05.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class NearestListCustomCell: UITableViewCell {

    static let identifier = "NearestListCustomCell"
    
    private let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.image = UIImage(systemName: "mappin.circle")
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customLight, size: 16)
        label.numberOfLines = 2
        return label
    }()
    private let addressRoadLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customLight, size: 12.5)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    
    let removeButton: UIButton = {
    let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .lightGray
        button.isHidden = true
        return button
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setImageView()
        setRemoveButton()
        setAddressLabel()
        setaddressRoadLabel()
    }
    private func setImageView() {
        
        contentView.addSubview(locationImageView)
        
        locationImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(CollectionDesign.padding)
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.04)
            $0.height.equalTo(locationImageView.snp.width)
        }
    }
    private func setRemoveButton() {
        
        contentView.addSubview(removeButton)
        
        removeButton.snp.makeConstraints {
            $0.top.width.height.equalTo(locationImageView)
            $0.trailing.equalToSuperview().inset(CollectionDesign.padding)
        }
    }
    private func setAddressLabel() {
        
        contentView.addSubview(addressLabel)
        
        addressLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(locationImageView.snp.trailing).offset(CollectionDesign.textPadding)
            $0.trailing.equalTo(contentView.snp.trailing).inset(contentView.frame.width / 7)
        }
    }
    private func setaddressRoadLabel() {
        
        contentView.addSubview(addressRoadLabel)
        
        addressRoadLabel.snp.makeConstraints {
            $0.top.equalTo(addressLabel.snp.bottom).offset(CollectionDesign.textPadding)
            $0.leading.trailing.equalTo(addressLabel)
            $0.bottom.equalToSuperview().inset(CollectionDesign.padding)
        }
    }
    
    func setAddress(addressName: String, roadAddress: String) {
        
        addressLabel.text = addressName
        addressRoadLabel.text = roadAddress
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
