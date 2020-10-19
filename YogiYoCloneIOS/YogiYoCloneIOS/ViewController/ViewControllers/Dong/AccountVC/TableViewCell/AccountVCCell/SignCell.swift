//
//  MyAccountListCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/23.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SignCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "SignCellID"
    
    private let signText: UILabel = {
        let label = UILabel()
        label.text = "로그인 하고 다양한 혜택을 받아보세요!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let singInButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    private lazy var singUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(signUpButtonHandler), for: .touchUpInside)
        return button
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureViews()
    }
    
    // MARK: @objc
    @objc private func signUpButtonHandler() {
        NotificationCenter.default.post(name: presentSignUpVC, object: nil, userInfo: nil)
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
        
        [signText, singInButton, singUpButton].forEach {
            contentView.addSubview($0)
        }
        
        signText.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.bottom.equalTo(self.snp.centerY)
            make.top.left.right.centerX.equalToSuperview()
        }
        
        singInButton.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.centerX).inset(6)
            make.left.bottom.equalToSuperview().inset(15)
        }
        
        singUpButton.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.snp.centerY)
            make.left.equalTo(self.snp.centerX).offset(6)
            make.right.bottom.equalToSuperview().inset(15)
        }
    }
}
