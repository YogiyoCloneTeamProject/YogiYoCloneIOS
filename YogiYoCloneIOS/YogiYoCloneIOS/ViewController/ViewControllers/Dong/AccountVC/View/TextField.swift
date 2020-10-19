//
//  TextField.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/27.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class TextField: UITextField {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        keyboardType = .numberPad
        addLeftPadding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
