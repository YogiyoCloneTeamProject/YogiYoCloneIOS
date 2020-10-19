//
//  HeaderView.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit
import Cosmos
import Kingfisher

class HeaderView: UICollectionReusableView {
    
    // MARK: Priperties
    var storeInfo: RestaurantInstanceData? {
        didSet {
            guard let storeInfo = storeInfo else { return }
            if let image = storeInfo.backImage {
                let url = URL(string: image)
                imageView.kf.setImage(with: url)
            }
            storeLabel.text = storeInfo.name
            cosmosView.rating = storeInfo.averageRating
            discountLabel.text = "\(numberFormatter.string(from: NSNumber(value: storeInfo.deliveryDiscount))!)원 할인"
            deliveryTime.text = "배달예상시간 \(storeInfo.deliveryTime)"
            cosmosView.text = "\(storeInfo.averageRating)"
        }
    }
    
    static let cellID = "HeaderViewCellID"
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "TopImageView")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let storeLabel: UILabel = {
        let label = UILabel()
        label.text = "Store Name"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let cosmosView: CosmosView = {
       let view = CosmosView()
        view.settings.totalStars = 5
        view.rating = 3.2
        view.settings.starMargin = 1
        view.settings.fillMode = .precise
        view.settings.starSize = 15
        view.settings.emptyBorderColor = .lightGray
        view.settings.filledImage = UIImage(named: "star")
        return view
    }()
    
    let label = UILabel()
    
    let discountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .systemRed
        return label
    }()
    
    let deliveryTime: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [storeLabel, cosmosView, discountLabel, deliveryTime])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.addBackgroundWithShadow(color: .white)
        return stackView
    }()
    
    let numberFormatter = NumberFormatter()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    private func configure() {
        numberFormatter.numberStyle = .decimal
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        [imageView, stackView].forEach {
            addSubview($0)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { [weak self] (make) in
            
            guard let self = self else { return }
            
            if self.imageView.image == nil {
                print("no")
                make.centerY.equalTo(self.snp.bottom).offset(-80)
                make.centerX.equalToSuperview()
                make.width.equalToSuperview().inset(16)
            } else {
                print("yes")
                make.centerY.equalTo(self.snp.bottom).offset(10)
                make.centerX.equalToSuperview()
                make.width.equalToSuperview().inset(16)
            }
        }
    }
}
