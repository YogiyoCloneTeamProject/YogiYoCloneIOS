//
//  RestaurantNewCustomCell.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/08/30.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Kingfisher

class RestaurantNewCustomCell: UICollectionViewCell {
    
    static let identifier = "RestaurantNewCustomCell"
    
    private let imageView = UIImageView()
    private let imageLabel = PaddingLabel(padding: UIEdgeInsets(top: 2.5, left: 5, bottom: 2.5, right: 5))
    
    private let titleLabel = UILabel()
    private let explanLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImageView()
        setImageLabel()
        setTitle()
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
            $0.width.equalToSuperview().multipliedBy(0.33)
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
    private func setExplainLabel() {
        explanLabel.font = UIFont(name: FontModel.customLight, size: 12)
        explanLabel.textAlignment = .left
        explanLabel.textColor = .gray
        contentView.addSubview(explanLabel)
        
        explanLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(CollectionDesign.collectionPadding)
            $0.leading.trailing.equalTo(titleLabel)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
    func setValue(image: String, imageText: String ,title: String, explain: String) {
        
        guard let imageURL = URL(string: image) else { return }
        imageView.kf.setImage(with: imageURL)
        
        imageLabel.text = imageText
        titleLabel.text = title
        explanLabel.text = explain
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
