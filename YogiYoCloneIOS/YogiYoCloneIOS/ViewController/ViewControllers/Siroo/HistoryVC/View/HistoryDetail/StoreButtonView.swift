//
//  StoreButtonView.swift
//  YogiYoCloneIOS
//
//  Created by junho woo on 2020/10/04.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class StoreButtonView: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("바비박스 (POS MENU FINAL) >", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFont(name: FontModel.customSemibold, size: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
