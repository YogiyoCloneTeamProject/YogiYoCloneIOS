//
//  TitleCheckBoxButton.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class CheckBoxButton: UIButton {
    
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
        setImage(UIImage(named: "EmptyBox"), for: .normal)
        imageView?.contentMode = .scaleAspectFit
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -17, bottom: 0, right: 0)
        setTitle("약관 전체동의", for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        contentHorizontalAlignment = .left
    }
}
