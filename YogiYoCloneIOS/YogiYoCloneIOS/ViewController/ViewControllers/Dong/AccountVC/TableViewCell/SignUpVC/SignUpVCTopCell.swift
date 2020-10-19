//
//  SignUpVCTopCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/09/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SignUpVCTopCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "SignUpVCTopCell"
    
    private let label: UILabel = {
       let label = UILabel()
        label.text = "SNS 계정으로도 간단하게 가입하실 수 있습니다."
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        
        addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
