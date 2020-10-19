//
//  FinishButton.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/27.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class FinishButton: UIButton {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("회원가입 완료", for: .normal)
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
