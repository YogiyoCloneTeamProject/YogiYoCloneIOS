//
//  StoreButtonView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/10/04.
//  Copyright © 2020 김믿음. All rights reserved.
//

import UIKit

class StoreButtonView: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("치킨더홈-광진화양점 >", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFont(name: FontModel.customSemibold, size: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
