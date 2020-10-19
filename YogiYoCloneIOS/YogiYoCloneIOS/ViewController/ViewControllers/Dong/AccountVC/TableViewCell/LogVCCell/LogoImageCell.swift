//
//  LogoImageCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/24.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class LogoImageCell: UITableViewCell {
    
    
    // MARK: Properties
    static let cellID = "LogoImageCellID"
    
    private let logoImageView: UIView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "SignVCLogoImage")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        addSubview(logoImageView)
        backgroundColor = .white
        
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.bottom.equalToSuperview()
        }
    }
}
