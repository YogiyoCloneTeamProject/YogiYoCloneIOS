//
//  RestaurantCustomCell.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Kingfisher

class RestaurantCustomCell: UICollectionViewCell {
    
    static let identifier = "RestaurantCustomItem"
    
    private let imageView = UIImageView()
    let imageLabel = PaddingLabel()
    private let truePadding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    private let falsePadding = UIEdgeInsets(top: 2.5, left: 10, bottom: 2.5, right: 10)
    
    private let titleLabel = UILabel()
    
    private let starImage = UIImageView()
    private let starPointLabel = UILabel()
    private let reviewLabel = UILabel()
    
    let explanLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImageView()
        setImageLabel()
        setTitle()
        setStarImage()
        setStarPoint()
        setReviewLabel()
        setExplainLabel()
    }
    
    private func setImageView() {
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(contentView)
            $0.height.equalTo(imageView.snp.width)
        }
    }
    private func setImageLabel() {
        imageLabel.font = .boldSystemFont(ofSize: 11)
        imageLabel.textAlignment = .center
        imageLabel.backgroundColor = .red
        imageLabel.textColor = .white
        imageView.addSubview(imageLabel)
        
        imageLabel.snp.makeConstraints {
            $0.leading.bottom.equalTo(imageView)
        }
    }
    private func setTitle() {
        titleLabel.font = UIFont(name: FontModel.customLight, size: 17)
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(CollectionDesign.collectionPadding)
            $0.leading.trailing.equalTo(contentView)
        }
    }
    private func setStarImage() {
        starImage.image = UIImage(named: "star")
        contentView.addSubview(starImage)
        
        starImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel)
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.1)
            $0.height.equalTo(starImage.snp.width)
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
        reviewLabel.font = UIFont(name: FontModel.customLight, size: 13)
        reviewLabel.textAlignment = .left
        reviewLabel.textColor = .darkGray
        contentView.addSubview(reviewLabel)
        
        reviewLabel.snp.makeConstraints {
            $0.centerY.equalTo(starPointLabel.snp.centerY)
            $0.leading.equalTo(starPointLabel.snp.trailing)
            $0.trailing.equalTo(titleLabel.snp.trailing)
        }
    }
    private func setExplainLabel() {
        explanLabel.font = UIFont(name: FontModel.customLight, size: 12)
        explanLabel.textAlignment = .left
        explanLabel.textColor = .gray
        contentView.addSubview(explanLabel)
        
        explanLabel.snp.makeConstraints {
            $0.top.equalTo(starImage.snp.bottom).offset(CollectionDesign.collectionPadding)
            $0.leading.trailing.equalTo(titleLabel)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
    func setValue(image: String, imageText: String? ,title: String, starPoint: Double, review: Int, explain: String) {
        
        guard let imageURL = URL(string: image) else { return }
        imageView.kf.setImage(with: imageURL)
        
        imageText == nil ? (imageLabel.padding = truePadding) : (imageLabel.padding = falsePadding)
        
        imageLabel.text = imageText
        titleLabel.text = title
        starPointLabel.text = "\(starPoint)"
        reviewLabel.text = " · 리뷰 \(review)"
        explanLabel.text = explain
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

