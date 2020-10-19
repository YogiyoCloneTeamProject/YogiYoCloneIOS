//
//  RecommendCollection.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/18.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class RecommendCollection: UIView {
    
    private let header: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        return label
    }()
    let queryButton: UIButton = {
        let button = UIButton()
        button.tintColor = .lightGray
        return button
    }()
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHeader()
        setCollection()
    }
    
    private func setHeader() {
        
        self.addSubview(header)
        header.addSubview(title)
        header.addSubview(queryButton)
        
        header.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(self.snp.width).multipliedBy(0.15)
        }
        title.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
        queryButton.snp.makeConstraints {
            $0.centerY.equalTo(title)
            $0.leading.equalTo(title.snp.trailing).offset(2)
        }
    }
    private func setCollection() {
        
        self.addSubview(collection)
        
        collection.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setValue(text: String, image: String?) {
        title.text = text
        if image == "더보기 〉" {
            queryButton.setTitle(image, for: .normal)
            queryButton.setTitleColor(.gray, for: .normal)
            queryButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
            queryButton.snp.remakeConstraints {
                $0.centerY.equalTo(title)
                $0.trailing.equalToSuperview().inset(CollectionDesign.padding)
            }
        } else {
        queryButton.setImage(UIImage(systemName: image ?? ""), for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
