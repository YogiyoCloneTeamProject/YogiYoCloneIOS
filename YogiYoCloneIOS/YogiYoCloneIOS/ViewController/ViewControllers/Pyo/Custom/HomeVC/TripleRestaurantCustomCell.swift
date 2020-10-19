//
//  TripleRestaurantCustomCell.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/08/28.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class TripleRestaurantCustomCell: UICollectionViewCell {
    
    static let identifier = "TripleRestaurantCustomItem"
    
    private let imageView = UIImageView()
    
    private let countLabel = UILabel()
    
    private let titleLabel = UILabel()
    
    private let starImage = UIImageView()
    private let starPointLabel = UILabel()
    private let reviewLabel = UILabel()
    
    private let explanLabel = UILabel()
    
    private let discountLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImageView()
        setCountLabel()
        setTitle()
        setStarImage()
        setStarPoint()
        setReviewLabel()
        setExplainLabel()
        setDiscountLabel()
    }
    
    private func setImageView() {
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.leading.bottom.equalTo(contentView)
            $0.width.equalTo(imageView.snp.height)
        }
    }
    private func setCountLabel() {
        countLabel.font = UIFont(name: FontModel.customSemibold, size: 18)
        countLabel.textAlignment = .center
        contentView.addSubview(countLabel)
        
        countLabel.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.width.equalTo(30)
            $0.leading.equalTo(imageView.snp.trailing)
        }
    }
    private func setTitle() {
        titleLabel.font = UIFont(name: FontModel.customLight, size: 18)
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.leading.equalTo(countLabel.snp.trailing)
        }
    }
    private func setStarImage() {
        starImage.image = UIImage(named: "star")
        contentView.addSubview(starImage)
        
        starImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel)
            $0.height.equalTo(contentView.snp.height).multipliedBy(0.2)
            $0.width.equalTo(starImage.snp.height)
        }
    }
    private func setStarPoint() {
        starPointLabel.font = UIFont(name: FontModel.customSemibold, size: 14)
        starPointLabel.textAlignment = .center
        contentView.addSubview(starPointLabel)
        
        starPointLabel.snp.makeConstraints {
            $0.centerY.equalTo(starImage.snp.centerY)
            $0.leading.equalTo(starImage.snp.trailing)
        }
    }
    private func setReviewLabel() {
        reviewLabel.font = UIFont(name: FontModel.customLight, size: 14)
        reviewLabel.textAlignment = .center
        reviewLabel.textColor = .darkGray
        contentView.addSubview(reviewLabel)
        
        reviewLabel.snp.makeConstraints {
            $0.centerY.equalTo(starPointLabel.snp.centerY)
            $0.leading.equalTo(starPointLabel.snp.trailing)
        }
    }
    private func setExplainLabel() {
        explanLabel.font = UIFont(name: FontModel.customLight, size: 14)
        explanLabel.textAlignment = .left
        explanLabel.textColor = .gray
        contentView.addSubview(explanLabel)
        
        explanLabel.snp.makeConstraints {
            $0.top.equalTo(starImage.snp.bottom)
            $0.leading.equalTo(starImage)
            $0.trailing.equalToSuperview()
        }
    }
    private func setDiscountLabel() {
        discountLabel.font = UIFont(name: FontModel.customLight, size: 14)
        discountLabel.textAlignment = .left
        discountLabel.textColor = .systemRed
        contentView.addSubview(discountLabel)
        
        discountLabel.snp.makeConstraints {
            $0.top.equalTo(explanLabel.snp.bottom)
            $0.leading.equalTo(explanLabel)
        }
    }
    func setValue(image: String, countText: String ,title: String, starPoint: Double, review: Int, explain: String, discountText: String) {
        
        guard let imageURL = URL(string: image) else { return }
        imageView.kf.setImage(with: imageURL)
        
        countLabel.text = countText
        titleLabel.text = title
        starPointLabel.text = "\(starPoint)"
        reviewLabel.text = " · 리뷰 \(review)"
        explanLabel.text = explain
        
        discountText != "0원 할인" ? (discountLabel.text = discountText) : (discountLabel.text = nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
