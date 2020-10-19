//
//  BannerCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/23.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class BannerCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "BannerCellID"
    
    private let bannerImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "MyAccountVCImage")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
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
        backgroundColor = ColorPiker.lightGray
        
        addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(7)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
