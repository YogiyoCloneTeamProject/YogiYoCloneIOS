//
//  LogoImageView.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class LogoImageView: UIView {
    
    // MARK: Properties
    private let logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "SignVCLogoImage")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
