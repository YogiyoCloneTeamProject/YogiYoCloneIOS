//
//  BottomListCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/23.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class BottomListCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "BottomListCellID"
    
    var titleLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    var newImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .darkGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var bottomDeviderView: UIView = {
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
        
        
        [titleLabel, newImageView, rightImageView, bottomDeviderView].forEach {
            addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
        }
        
        newImageView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(15)
        }
        
        rightImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(15)
            make.width.height.equalTo(17)
        }
        
        bottomDeviderView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
}
