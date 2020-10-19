//
//  GetCodeButton.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/27.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class GetCodeButton: UIButton {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        setTitle("인증번호 받기", for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
