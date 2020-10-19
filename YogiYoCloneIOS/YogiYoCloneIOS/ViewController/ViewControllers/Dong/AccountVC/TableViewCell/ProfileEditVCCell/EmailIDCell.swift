//
//  EmailIDCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/29.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class EmailIDCell: UITableViewCell {
    
    // MARK: Properties
    public var appUser: AppUser? {
        didSet {
            emailID.text = appUser?.email
        }
    }
    
    static let cellID = "EmailIDCellID"
    
    private var emailIDTitle: UILabel = {
       let label = UILabel()
        label.text = "이메일 아이디"
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private var emailID: UILabel = {
       let label = UILabel()
        label.text = "user Email"
        return label
    }()
    
    private var rightImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: " ")
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        
        [emailIDTitle, emailID, rightImageView].forEach {
            addSubview($0)
        }
        
        emailIDTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(15)
        }
        
        emailID.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(15)
        }
        
        rightImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(15)
            make.width.height.equalTo(40)
        }
    }
}
