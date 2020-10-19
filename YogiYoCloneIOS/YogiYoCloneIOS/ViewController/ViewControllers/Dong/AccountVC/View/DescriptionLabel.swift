//
//  DescriptionLabel.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class DescriptionLabel: UILabel {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        text = "요기요 서비스를 이용하기 위해서\n약관동의가 필요합니다."
        numberOfLines = 0
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 21, weight: .semibold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
