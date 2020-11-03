//
//  GoogleBottomView.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/29.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class GoogleBottomView: UIView {
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customLight, size: 16)
        label.numberOfLines = 2
        return label
    }()
    let roadLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customLight, size: 12.5)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        
        textField.clearButtonMode = .always
        textField.isSelected = true
        textField.layer.borderWidth = 0.5
        textField.placeholder = " 상세주소를 입력하세요 (건물명, 동/호수 등)"
        textField.font = .systemFont(ofSize: 14)
        textField.placeholderRect(forBounds: CGRect(x: 10, y: 0, width: 100, height: 50))
        return textField
    }()
    
    let setButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitle("선택한 위치로 설정", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.titleLabel?.textColor = .white
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        
        setAddressLabel()
        setRoadLabel()
        setTextField()
        setSetButton()
    }
    private func setAddressLabel() {
        
        self.addSubview(addressLabel)
        
        addressLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
    }
    private func setRoadLabel() {
        
        self.addSubview(roadLabel)
        
        roadLabel.snp.makeConstraints {
            $0.top.equalTo(addressLabel.snp.bottom).offset(CollectionDesign.textPadding)
            $0.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
    }
    private func setTextField() {
        
        self.addSubview(textField)
        
        textField.snp.makeConstraints {
            $0.top.equalTo(roadLabel.snp.bottom).offset(CollectionDesign.textPadding)
            $0.leading.trailing.equalToSuperview().inset(CollectionDesign.padding)
            $0.height.equalTo(textField.snp.width).multipliedBy(0.15)
        }
    }
    private func setSetButton() {
        
        self.addSubview(setButton)
        
        setButton.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(CollectionDesign.textPadding)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(setButton.snp.width).multipliedBy(0.13)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
