//
//  WalletCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/23.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class WalletCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "WalletCellID"
    
    var myCouponButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        let attributedTitle = NSMutableAttributedString(string: "쿠폰함", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedTitle.append(NSAttributedString(string: "\n-", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    var myPointButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        let attributedTitle = NSMutableAttributedString(string: "포인트", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedTitle.append(NSAttributedString(string: "\n-", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    var myReviewButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        let attributedTitle = NSMutableAttributedString(string: "리뷰관리", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedTitle.append(NSAttributedString(string: "\n0건", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    private lazy var topDeviderView: UIView = {
       let view = UIView()
        view.backgroundColor = ColorPiker.lightGray
        return view
    }()
    
    private lazy var deviderView1: UIView = {
       let view = UIView()
        view.backgroundColor = ColorPiker.lightGray
        return view
    }()
    
    private lazy var deviderView2: UIView = {
       let view = UIView()
        view.backgroundColor = ColorPiker.lightGray
        return view
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [myCouponButton, myPointButton, myReviewButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
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
        
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        [topDeviderView, deviderView1, deviderView2].forEach {
            stackView.addSubview($0)
        }
        
        topDeviderView.snp.makeConstraints { (make) in
            make.width.top.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        deviderView1.snp.makeConstraints { [weak self](make) in
            guard let self = self else { return }
            make.centerX.equalTo(self.myPointButton.snp.left)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(0.4)
        }
        
        deviderView2.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.centerX.equalTo(self.myPointButton.snp.right)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(0.4)
        }
    }
}
