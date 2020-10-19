//
//  MyListBannerView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/28.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class MyOrderListBannerView: UIView {
    
    let myOrderListbannerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.autoresizingMask = .flexibleWidth
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = false
        scrollView.showsHorizontalScrollIndicator = false
        
        
        
        
        return scrollView
    }()
    
    private let myOrderListbannerContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let myOrderListbannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "MyListbanner1")
        return imageView
    }()
    
    private let myOrderListbannerImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "MyListbanner2")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func setBannerScrollView() {
        myOrderListbannerScrollView.contentSize = CGSize(width: myOrderListbannerScrollView.frame.width * 2, height: myOrderListbannerScrollView.frame.height)
        self.addSubview(myOrderListbannerScrollView)
        myOrderListbannerScrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        setContentView()
    }
    
    private func setContentView() {
        
        myOrderListbannerScrollView.addSubview(myOrderListbannerContentView)
        
        myOrderListbannerContentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.centerY.equalTo(myOrderListbannerScrollView)
            $0.width.equalTo(myOrderListbannerScrollView.frame.width * 2)
        }
        
        setBannerImageView()
    }
    private func setBannerImageView() {
        myOrderListbannerContentView.addSubview(myOrderListbannerImageView)
        
        myOrderListbannerImageView.snp.makeConstraints {
            $0.top.width.leading.bottom.equalTo(myOrderListbannerScrollView)
        }
        
        myOrderListbannerContentView.addSubview(myOrderListbannerImageView2)
        
        myOrderListbannerImageView2.snp.makeConstraints {
            $0.top.width.bottom.equalTo(myOrderListbannerScrollView)
            $0.leading.equalTo(myOrderListbannerImageView.snp.trailing)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
