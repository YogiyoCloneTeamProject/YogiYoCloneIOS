//
//  ProfileCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/28.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    // MARK: Properties
    public var appUser: AppUser? {
        didSet {
            userName.text = appUser?.nickname
        }
    }
    
    static let cellID = "ProfileCellID"
    
    private let riceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rice")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let yogiFriendLabel: UILabel = {
        let label = UILabel()
        label.text = "요기프렌드"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    var userName: UILabel = {
       let label = UILabel()
        label.text = "유저이름"
        return label
    }()
    
    let goToProfileEditButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .black
        return button
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
        
        addSubview(riceImageView)
        [riceImageView, yogiFriendLabel, userName, goToProfileEditButton].forEach {
            addSubview($0)
        }
        
        riceImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().inset(13)
            make.width.height.equalTo(60)
            make.centerY.equalToSuperview()
        }
        
        yogiFriendLabel.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.left.equalTo(self.riceImageView.snp.right).offset(13)
            make.top.equalToSuperview().inset(25)
        }
        
        userName.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.left.equalTo(self.riceImageView.snp.right).offset(13)
            make.bottom.equalToSuperview().inset(25)
        }
        
        goToProfileEditButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(4)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(35)
        }
    }
}
