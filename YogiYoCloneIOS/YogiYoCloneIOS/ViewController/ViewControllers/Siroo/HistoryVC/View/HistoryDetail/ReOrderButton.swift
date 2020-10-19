//
//  ReOrderButton.swift
//  YogiYoCloneIOS
//
//  Created by junho woo on 2020/10/04.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ReOrderButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setTitle("재주문", for: .normal)
        self.setTitleColor(ColorPiker.customRed, for: .normal)
        self.layer.borderWidth = 2
        self.layer.borderColor = ColorPiker.customRed.cgColor
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50)
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
