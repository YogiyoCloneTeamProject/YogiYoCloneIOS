//
//  StackMedium.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/11/03.
//  Copyright © 2020 김믿음. All rights reserved.

//

import UIKit

class StackMedium : UIStackView {

    
    private let label : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customSemibold, size: 15)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    private let value : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customLight, size: 14)
        label.textAlignment = .right
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.alignment = .fill
       
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func contents(label: String, value: String) {
        self.label.text = label
        self.value.text = value
        
        self.insertArrangedSubview(self.label, at: 0)
        self.insertArrangedSubview(self.value, at: 1)
    }

}
