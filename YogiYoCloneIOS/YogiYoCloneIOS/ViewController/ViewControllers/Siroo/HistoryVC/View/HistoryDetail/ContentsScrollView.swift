//
//  ContentsScrollView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/10/04.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ContentsScrollView: UIScrollView {
    
    private let contentsView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentSize = CGSize(width: scrollView.frame.size.width, height: 1200.0)
        self.alwaysBounceHorizontal = false
        self.alwaysBounceVertical = true
        self.showsVerticalScrollIndicator = false
        
        addSubview(contentsView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getContentsView() -> UIView {
            contentsView.snp.makeConstraints { (make) in
                make.top.equalTo(self)
                make.width.equalTo(self)
            }
            return contentsView
        }


}
