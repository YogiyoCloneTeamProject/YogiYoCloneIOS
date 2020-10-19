//
//  ShowContentLabel.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ShowContentButton: UIButton {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("내용보기", for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
