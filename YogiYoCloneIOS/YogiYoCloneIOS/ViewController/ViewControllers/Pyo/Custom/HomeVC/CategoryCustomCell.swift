//
//  CategoryCustomCell.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/08/22.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class CategoryCustomCell: UICollectionViewCell {
    
    static let identifier = "CategoryCustomItem"
    
    private let imageView = UIImageView()
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImageView()
        setTitle()
    }
    private func setImageView() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(contentView)
            $0.height.equalTo(imageView.snp.width)
        }
    }
    private func setTitle() {
        label.font = UIFont(name: FontModel.customLight, size: 12)
        label.textAlignment = .center
        contentView.addSubview(label)
        
        label.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(CollectionDesign.textPadding)
            $0.leading.trailing.bottom.equalTo(contentView)
        }
    }
    func setValue(image: String, title: String) {
        
        imageView.image = UIImage(named: image)
        label.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
