//
//  BannerView.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class BannerView: UIView {
    
    let bannerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let bannerContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "MyAccountVCImage")
        return imageView
    }()
    
    private let bannerImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "MyAccountVCImage")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBannerScrollView()
        setContentView()
        setBannerImageView()
    }
    
    private func setBannerScrollView() {
        
        self.addSubview(bannerScrollView)
        
        bannerScrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    private func setContentView() {
        
        bannerScrollView.addSubview(bannerContentView)
        
        bannerContentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.centerY.equalTo(bannerScrollView)
        }
    }
    private func setBannerImageView() {
        
        bannerContentView.addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints {
            $0.top.width.leading.bottom.equalTo(bannerScrollView)
        }
        
        bannerContentView.addSubview(bannerImageView2)
        
        bannerImageView2.snp.makeConstraints {
            $0.top.width.bottom.equalTo(bannerScrollView)
            $0.leading.equalTo(bannerImageView.snp.trailing)
            $0.trailing.equalTo(bannerContentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
