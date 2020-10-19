//
//  CategoryCollection.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/18.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class CategoryCollection: UIView {
    
    let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(collection)
        
        collection.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
