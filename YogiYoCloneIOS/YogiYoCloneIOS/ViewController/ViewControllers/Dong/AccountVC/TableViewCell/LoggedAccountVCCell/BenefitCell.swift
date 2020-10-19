//
//  BenefitCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/28.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class BenefitCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "BenefitCellID"
    
    private lazy var redDotView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        view.layer.cornerRadius = view.frame.width / 2
        return view
    }()
    
    private let subtitleLabel: UILabel = {
       let label = UILabel()
        label.text = "3회 더 주문시 다음 달 요기 패밀리!"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let goToUserBenefitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.setTitle("회원 혜택 보기  ", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.imageView?.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.imageToRight()
        return button
    }()
    
    private let deviderView: UIView = {
       let view = UIView()
        view.backgroundColor = ColorPiker.lightGray
        return view
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    private func configure() {
        selectionStyle = .none
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .white
        
        addSubview(redDotView)
        [redDotView, subtitleLabel, goToUserBenefitButton, deviderView].forEach {
            addSubview($0)
        }
        
        redDotView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(15)
            make.width.height.equalTo(5)
        }
        
        subtitleLabel.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.centerY.equalToSuperview()
            make.left.equalTo(self.redDotView.snp.right).offset(7)
        }
        
        goToUserBenefitButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(15)
        }
        
        deviderView.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.top.width.equalToSuperview()
        }
    }
}
