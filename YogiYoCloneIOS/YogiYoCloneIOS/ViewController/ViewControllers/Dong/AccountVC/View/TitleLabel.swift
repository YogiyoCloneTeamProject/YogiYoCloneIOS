//
//  TitleLabel.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/27.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        text = "휴대전화 등록"
        font = UIFont.systemFont(ofSize: 22)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
