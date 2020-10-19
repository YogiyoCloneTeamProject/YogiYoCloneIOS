//
//  SegMenuCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/22.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SegMenuCell: UICollectionViewCell {
    
    // MARK: Properties
    var photoMenus: [PhotoMenu]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    static let cellID = "SegMenuCellID"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        return view
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
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(SegMenuItemCell.self, forCellWithReuseIdentifier: SegMenuItemCell.cellID)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = ColorPiker.lightGray
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension SegMenuCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (frame.width - 70) / 2, height: frame.height - 22)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: -5, right: 0)
    }
}

extension SegMenuCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let photoMenus = self.photoMenus else { return 0 }
        return photoMenus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SegMenuItemCell.cellID, for: indexPath) as? SegMenuItemCell else { return UICollectionViewCell() }
        guard let photoMenus = self.photoMenus else { return cell }
        cell.photoMenu = photoMenus[indexPath.row]
        return cell
    }
}
