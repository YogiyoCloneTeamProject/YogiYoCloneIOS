//
//  HelpTitleLabel.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/27.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class HelpTitleLabel: UILabel {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        text = "인증번호가 도착하지 않았을 경우 '인증번호 받기' 버튼을 다시 눌러주세요."
        font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        numberOfLines = 0
        textColor = .brown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
