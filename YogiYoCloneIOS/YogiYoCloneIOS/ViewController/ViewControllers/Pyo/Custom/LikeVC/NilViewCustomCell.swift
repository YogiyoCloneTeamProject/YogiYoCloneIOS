//
//  NilViewCustomCell.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class NilViewCustomCell: UITableViewCell {
    
    static let identifier = "NilViewCustomCell"
    
    let motherView = UIView()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LikeHouse")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()
    private let nilLabel: UILabel = {
        let label = UILabel()
        label.text = "찜한 음식점이 없습니다."
        label.font = UIFont(name: FontModel.customLight, size: 15)
        return label
    }()
    private let explainLabel: UILabel = {
        let label = UILabel()
        label.text = """
            관심있는 음식점 상세화면에서 하트 아이콘을 눌러
            '찜' 하시면, 더욱 편리하게 이용하실 수 있어요!
            """
        label.font = UIFont(name: FontModel.customLight, size: 13)
        label.numberOfLines = 0
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    let nilButton: UIButton = {
        let button = UIButton()
        button.setTitle("음식점 보러가기", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customMedium, size: 14)
        button.backgroundColor = .red
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setView()
        setImageView()
        setMotherStack()
        setNilButton()
    }
    private func setView() {
        
        self.selectionStyle = .none
        self.backgroundColor = .systemBackground
        
        contentView.addSubview(motherView)
        
        motherView.snp.makeConstraints {
            $0.leading.centerY.trailing.equalToSuperview()
        }
    }
    private func setImageView() {
        
        motherView.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.225)
            $0.height.equalTo(logoImageView.snp.width)
        }
    }
    private func setMotherStack() {
        
        labelStack.addArrangedSubview(nilLabel)
        labelStack.addArrangedSubview(explainLabel)
        motherView.addSubview(labelStack)
        
        labelStack.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(contentView.frame.width * 0.03)
            $0.width.centerX.equalToSuperview()
            $0.height.equalTo(contentView.frame.width * 0.25)
        }
    }
    private func setNilButton() {
        
        nilButton.tag = 0
        motherView.addSubview(nilButton)
        
        nilButton.snp.makeConstraints {
            $0.top.equalTo(labelStack.snp.bottom).offset(contentView.frame.width * 0.03)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.55)
            $0.height.equalTo(contentView.frame.width * 0.125)
            $0.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
