//
//  DetailMenuListCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/09/17.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class DetailMenuListCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "DetailMenuListCellID"
    
    var menuName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    var caption: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    var menuPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    var menuImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let deviderView: UIView = {
       let view = UIView()
        view.backgroundColor = ColorPiker.lightGray
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [menuName, caption, menuPrice])
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        return stackView
    }()
    
    var menu: Menu? {
        didSet {
            menuImageView.kf.setImage(with: URL(string: menu?.image ?? " "))
            menuName.text = menu?.name
            guard let intPrice = menu?.price else { return }
            let string = "\(numberFormatter.string(from: NSNumber(value: intPrice)) ?? "")" + "원"
            menuPrice.text = string
            caption.text = menu?.caption
        }
    }
    
    let numberFormatter = NumberFormatter()
    
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
        numberFormatter.numberStyle = .decimal
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        [menuImageView, stackView, deviderView].forEach {
            addSubview($0)
        }
        
        menuImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(10)
            make.width.equalTo(125)
            make.height.equalTo(75)
        }
        
        stackView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            make.centerY.equalToSuperview()
            make.right.equalTo(self.menuImageView.snp.left)
            make.left.equalToSuperview().inset(18)
        }
        
        deviderView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
    }
}
