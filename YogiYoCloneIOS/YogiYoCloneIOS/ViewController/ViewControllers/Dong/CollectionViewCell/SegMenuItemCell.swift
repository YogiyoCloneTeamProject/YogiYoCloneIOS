//
//  SegMenuItemCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/22.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SegMenuItemCell: UICollectionViewCell {
    
    // MARK: Properties
    var photoMenu: PhotoMenu? {
        didSet {
            guard let photoMenu = photoMenu else { return }
            guard let imageURL = URL(string: photoMenu.image) else { return }
            menuImageButotn.kf.setImage(with: imageURL, for: .normal)
            menuTitleLabel.text = photoMenu.name
            menuPrice = photoMenu.price
        }
    }
    
    private var menuPrice: Int? {
        didSet {
            guard let minPrice = menuPrice else { return }
            guard let price = numberFormatter.string(from: NSNumber(value: minPrice)) else { return }
            menuPriceLabel.text = "\(price)원"
        }
    }
    
    static let cellID = "SegMenuItemCellID"
    
    private var menuTitle = "육쌈 냉면"
    //    private var menuPrice = 10000
    
    let numberFormatter = NumberFormatter()
    
    private var menuImageButotn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "TopImageView"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    private lazy var menuTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "\(menuTitle)"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var menuPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    private func configure() {
        numberFormatter.numberStyle = .decimal
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .white
        
        [menuImageButotn, menuTitleLabel, menuPriceLabel].forEach {
            addSubview($0)
        }
        
        menuImageButotn.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(115)
        }
        
        menuTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(menuImageButotn.snp.bottom).offset(8)
            make.height.equalTo(25)
            make.right.equalToSuperview()
            make.left.equalToSuperview().inset(10)
        }
        
        menuPriceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(menuTitleLabel.snp.bottom).offset(2)
            make.height.equalTo(25)
            make.right.equalToSuperview()
            make.left.equalToSuperview().inset(10)
        }
    }
}
