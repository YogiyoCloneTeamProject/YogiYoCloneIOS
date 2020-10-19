//
//  CloseButton.swift
//  YogiYoCloneIOS
//
//  Created by junho woo on 2020/10/04.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class CloseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(systemName: "xmark"), for: .normal)
        self.imageView?.tintColor = .black
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
