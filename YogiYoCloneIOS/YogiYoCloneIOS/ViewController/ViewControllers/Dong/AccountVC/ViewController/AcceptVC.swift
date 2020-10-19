//
//  AcceptVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class AcceptVC: UIViewController {
    
    // MARK: Properties
    private let logoImageView: LogoImageView = {
        let imageView = LogoImageView()
        return imageView
    }()
    
    private let descriptionLabel: DescriptionLabel = {
       let label = DescriptionLabel()
        return label
    }()
    
    private lazy var titleCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var firstCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.configureAttribute(firstText: "이용약관 동의")
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.configureAttribute(firstText: "개인정보 수집 및 이용동의")
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var thirdCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.configureAttribute(firstText: "전자금융거래 이용약관")
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var fourthCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.configureAttribute(firstText: "만 14세 이상 사용자")
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var fiffthCheckBoxButton: CheckBoxButton = {
        let button = CheckBoxButton()
        button.configureAttributeOption(firstText: "요기요 혜택 알림 동의", secondText: "(선택)")
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private let firstShowContentButton: ShowContentButton = {
        let button = ShowContentButton()
        return button
    }()
    
    private let secondShowContentButton: ShowContentButton = {
        let button = ShowContentButton()
        return button
    }()
    
    private let thirdShowContentButton: ShowContentButton = {
        let button = ShowContentButton()
        return button
    }()
    
    private let fourthShowContentButton: ShowContentButton = {
        let button = ShowContentButton()
        return button
    }()
    
    private lazy var showContentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstShowContentButton, secondShowContentButton, thirdShowContentButton, fourthShowContentButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private lazy var acceptStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstCheckBoxButton, secondCheckBoxButton, thirdCheckBoxButton, fourthCheckBoxButton, fiffthCheckBoxButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.addBackgroundWithShadow(color: .lightGray)
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configure()
        configureViews()
    }
    
    // MARK: @Objc
    @objc private func didTapPopButton() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func didTapCheckBoxButton(_ sender: UIButton) {
        let elements = [titleCheckBoxButton, firstCheckBoxButton, secondCheckBoxButton, thirdCheckBoxButton, fourthCheckBoxButton, fiffthCheckBoxButton]
        if sender == titleCheckBoxButton {
            switch sender.isSelected {
            case false:
                elements.forEach {
                    $0.setImage(UIImage(named: "NonEmptyBox"), for: .normal)
                    $0.isSelected = true
                }
            case true:
                elements.forEach {
                    $0.setImage(UIImage(named: "EmptyBox"), for: .normal)
                    $0.isSelected = false
                }
            }
        } else {
            if titleCheckBoxButton.isSelected {
                titleCheckBoxButton.setImage(UIImage(named: "EmptyBox"), for: .normal)
                titleCheckBoxButton.isSelected = false
            } else {
                titleCheckBoxButton.setImage(UIImage(named: "NonEmptyBox"), for: .normal)
                titleCheckBoxButton.isSelected = true
            }
            switch sender.isSelected {
            case false:
                sender.setImage(UIImage(named: "NonEmptyBox"), for: .normal)
                sender.isSelected = true
            case true:
                sender.setImage(UIImage(named: "EmptyBox"), for: .normal)
                sender.isSelected = false
            }
        }
    }
    
    @objc private func didTapNextButton() {
        let phoneAcceptVC = PhoneAcceptVC()
        navigationController?.pushViewController(phoneAcceptVC, animated: true)
    }
    
    // MARK: Helpers
    private func configureNavi() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapPopButton))
    }
    
    // MARK: Configure
    private func configure() {
        
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .white
        
        [logoImageView, descriptionLabel, titleCheckBoxButton, acceptStackView, nextButton].forEach {
            view.addSubview($0)
        }
        
        logoImageView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(5)
        }
        
        titleCheckBoxButton.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(45)
            make.left.right.equalToSuperview()
            make.height.equalTo(28)
        }
        
        acceptStackView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.titleCheckBoxButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }

        acceptStackView.addSubview(showContentStackView)

        showContentStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(33)
            make.right.equalToSuperview().inset(28)
        }
        
        nextButton.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.top.equalTo(self.acceptStackView.snp.bottom).offset(37)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalTo(45)
        }
    }
}
