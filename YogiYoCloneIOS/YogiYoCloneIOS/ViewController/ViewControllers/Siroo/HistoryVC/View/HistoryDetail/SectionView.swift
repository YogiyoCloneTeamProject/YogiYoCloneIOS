//
//  SectionView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/10/04.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SectionView: UIView {
    
    private var topLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTopLine()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTopLine() {
        topLine.backgroundColor = .systemGray
        addSubview(topLine)
        
        
        topLine.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(0.5)
        }
        
        
    }
    func lightLine() {
        topLine.backgroundColor = .lightGray
        topLine.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
        }
    }
}
