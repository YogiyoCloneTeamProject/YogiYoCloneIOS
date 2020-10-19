//
//  ContentsScrollView.swift
//  YogiYoCloneIOS
//
//  Created by junho woo on 2020/10/04.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ContentsScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentSize = CGSize(width: scrollView.frame.size.width, height: 1200.0)
        self.alwaysBounceHorizontal = false
        self.alwaysBounceVertical = true
        self.showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
